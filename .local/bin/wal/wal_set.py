#!/usr/bin/env python3

from sys import argv
from os import environ
import pywal as wal
# from pywal.backends import wal as wal_backend
# BACKEND = 'mine'
BACKEND = None

try:
    INPUT_PATH = argv[1]
except IndexError:
    # INPUT_PATH = environ['XDG_WALLPAPER_DIR'] + '/favorites'
    INPUT_PATH = environ['XDG_WALLPAPER_DIR']

if BACKEND == 'mine':
    from scheme_generator.scheme_generator import gen_wal_scheme
    get_scheme = gen_wal_scheme
else:
    get_scheme = lambda path: wal.colors.get(path, backend=BACKEND)

path = wal.image.get(INPUT_PATH)
scheme = get_scheme(path)
# update terminal colors
wal.sequences.send(scheme)
# export template files
wal.export.every(scheme)

# output image used to shell
print(path)
