//
// Copyright (c) 2018 Dimitar Toshkov Zhekov <dimitar.zhekov@gmail.com>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation; either version 2 of
// the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//

'use strict';

const fnutil = require('./fnutil.js');
const fncli = require('./fncli.js');
const fnio = require('./fnio.js');
const bdf = require('./bdf.js');

// -- Options --
const HELP = ('' +
	'usage: ucstoany [-f] [-F FAMILY] [-o OUTPUT] INPUT REGISTRY ENCODING TABLE...\n' +
	'Generate a BDF font subset.\n' +
	'\n' +
	'  -f, --filter   Discard characters with unicode FFFF; with registry ISO10646,\n' +
	'                 encode the first 32 characters with their indexes; with other\n' +
	'                 registries, encode all characters with indexes\n' +
	'  -F FAMILY      output font family name (default = input)\n' +
	'  -o OUTPUT      output file (default = stdout)\n' +
	'  TABLE          text file, one hexadecimal unicode per line\n' +
	'  --help         display this help and exit\n' +
	'  --version      display the program version and license, and exit\n' +
	'  --excstk       display the exception stack on error\n' +
	'\n' +
	'The input must be a BDF 2.1 font encoded in the unicode range.\n' +
	'Unlike ucs2any, all TABLE-s form a single subset of the input font.\n');

const VERSION = 'ucstoany 1.48, Copyright (C) 2018 Dimitar Toshkov Zhekov\n\n' + fnutil.GPL2PLUS_LICENSE;

class Params {
	constructor() {
		this.filter = false;
		this.family = null;
		this.output = null;
	}
}

class Options extends fncli.Options {
	constructor() {
		super(['-F', '-o'], HELP, VERSION);
		this.params = new Params();
	}

	parse(name, optarg) {
		switch (name) {
		case '-f':
		case '--filter':
			this.params.filter = true;
			break;
		case '-F':
			if (optarg.includes('-')) {
				throw new Error('family name may not contain "-"');
			}
			this.params.family = optarg;
			break;
		case '-o':
			this.params.output = optarg;
			break;
		default:
			super.parse(name, optarg);
		}
	}
}

// MAIN
function mainProgram(nonopt, parsed) {
	if (nonopt.length < 4) {
		throw new Error('invalid number of arguments, try --help');
	}

	const input = nonopt[0];
	const registry = nonopt[1];
	const encoding = nonopt[2];
	let newCodes = [];

	if (!registry.match(/^[A-Za-z][\w.:()]*$/) || !encoding.match(/^[\w.:()]+$/)) {
		throw new Error('invalid registry or encoding');
	}

	// READ INPUT
	let ifs = new fnio.InputStream(input);

	try {
		var oldFont = bdf.Font.read(ifs);
		ifs.close();
	} catch (e) {
		e.message = ifs.location() + e.message;
		throw e;
	}

	// READ TABLES
	nonopt.slice(3).forEach(name => {
		ifs = new fnio.InputStream(name);

		try {
			ifs.readLines(line => {
				newCodes.push(fnutil.parseHex('unicode', line));
			});
			ifs.close();
		} catch (e) {
			e.message = ifs.location() + e.message;
			throw e;
		}
	});

	if (newCodes.length === 0) {
		throw new Error('no characters in the output font');
	}

	// CREATE GLYPHS
	let newFont = new bdf.Font();
	let charMap = [];
	let index = 0;
	let unstart = 0;
	let family = parsed.family !== null ? parsed.family : oldFont.xlfd[bdf.XLFD.FAMILY_NAME];

	if (parsed.filter) {
		unstart = (registry === 'ISO10646') ? 32 : bdf.CHARS_MAX;
	}

	// faster than Map() for <= 4K chars
	oldFont.chars.forEach(char => (charMap[char.code] = char));

	newCodes.forEach(code => {
		let oldChar = charMap[code];
		let uniFFFF = (oldChar == null);

		if (code === 0xFFFF && parsed.filter) {
			index++;
			return;
		}

		if (uniFFFF) {
			if (code !== 0xFFFF) {
				throw new Error(`${input} does not contain U+${fnutil.unihex(code)}`);
			}

			if (oldFont.defaultCode !== -1) {
				oldChar = charMap[oldFont.defaultCode];
			} else {
				oldChar = charMap[0xFFFD];

				if (oldChar == null) {
					throw new Error(`${input} does not contain U+FFFF, and no replacement found`);
				}
			}
		}

		let newChar = new bdf.Char();

		newChar.props = new Map(oldChar.props);
		newChar.code = index >= unstart ? code : index;
		index++;
		newChar.props.set('ENCODING', newChar.code.toString());
		newChar.bbx = oldChar.bbx;
		newChar.data = oldChar.data;
		newFont.chars.push(newChar);

		if (uniFFFF) {
			newChar.props.set('STARTCHAR', 'uniFFFF');
		} else if (oldChar.code === oldFont.defaultCode || (oldChar.code === 0xFFFD && newFont.defaultCode === -1)) {
			newFont.defaultCode = newChar.code;
		}
	});

	// CREATE HEADER
	let numProps;

	newFont.bbx = oldFont.bbx;
	oldFont.props.forEach((value, name) => {
		switch (name) {
		case 'FONT':
			newFont.xlfd = oldFont.xlfd.slice();
			newFont.xlfd[bdf.XLFD.FAMILY_NAME] = family;
			newFont.xlfd[bdf.XLFD.CHARSET_REGISTRY] = registry;
			newFont.xlfd[bdf.XLFD.CHARSET_ENCODING] = encoding;
			value = newFont.xlfd.join('-');
			break;
		case 'STARTPROPERTIES':
			numProps = fnutil.parseDec(name, value, 1);
			break;
		case 'FAMILY_NAME':
			value = fnutil.quote(family);
			break;
		case 'CHARSET_REGISTRY':
			value = fnutil.quote(registry);
			break;
		case 'CHARSET_ENCODING':
			value = fnutil.quote(encoding);
			break;
		case 'DEFAULT_CHAR':
			if (newFont.defaultCode !== -1) {
				value = newFont.defaultCode.toString();
			} else {
				numProps -= 1;
				return;
			}
			break;
		case 'ENDPROPERTIES':
			if (newFont.defaultCode !== -1 && !newFont.props.has('DEFAULT_CHAR')) {
				newFont.props.set('DEFAULT_CHAR', newFont.defaultCode.toString());
				numProps += 1;
			}
			newFont.props.set('STARTPROPERTIES', numProps.toString());
			break;
		case 'CHARS':
			value = newFont.chars.length.toString();
			break;
		}
		newFont.props.set(name, value);
	});

	// WRITE OUTPUT
	let ofs = new fnio.OutputStream(parsed.output);

	try {
		newFont.write(ofs);
		ofs.close();
	} catch (e) {
		e.message = ofs.location() + e.message + ofs.destroy();
		throw e;
	}
}

fncli.start('ucstoany.js', new Options(), mainProgram);
