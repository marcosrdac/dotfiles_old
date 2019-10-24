#!/usr/bin/env bash
#	default color: 178984
oldglyph=#0f3232
newglyph=#19724b

#	Front
#	default color: 36d7b7
oldfront=#206c6b
newfront=#2dcb87

#	Back
#	default color: 1ba39c
oldback=#164a49
newback=#1f8b5c

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
