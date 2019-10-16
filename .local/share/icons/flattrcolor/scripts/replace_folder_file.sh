#!/usr/bin/env bash
#	default color: 178984
oldglyph=#240d0f
newglyph=#0f3232

#	Front
#	default color: 36d7b7
oldfront=#561e23
newfront=#206c6b

#	Back
#	default color: 1ba39c
oldback=#3b1518
newback=#164a49

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
