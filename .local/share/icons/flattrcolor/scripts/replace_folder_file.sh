#!/usr/bin/env bash
#	default color: 178984
oldglyph=#353634
newglyph=#486114

#	Front
#	default color: 36d7b7
oldfront=#656661
newfront=#84b424

#	Back
#	default color: 1ba39c
oldback=#454643
newback=#5b7b19

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
