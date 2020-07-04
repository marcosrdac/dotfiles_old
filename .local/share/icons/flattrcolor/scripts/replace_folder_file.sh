#!/usr/bin/env bash
#	default color: 178984
oldglyph=#423659
newglyph=#392f20

#	Front
#	default color: 36d7b7
oldfront=#74609e
newfront=#705b3e

#	Back
#	default color: 1ba39c
oldback=#50426c
newback=#4d3f2b

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
