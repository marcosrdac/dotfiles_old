#!/usr/bin/env bash
#	default color: 178984
oldglyph=#282f3c
newglyph=#6f4753

#	Front
#	default color: 36d7b7
oldfront=#4c5973
newfront=#be798d

#	Back
#	default color: 1ba39c
oldback=#343d4f
newback=#825361

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
