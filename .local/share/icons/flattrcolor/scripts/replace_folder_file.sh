#!/usr/bin/env bash
#	default color: 178984
oldglyph=#584848
newglyph=#5e4022

#	Front
#	default color: 36d7b7
oldfront=#997e7e
newfront=#ab753c

#	Back
#	default color: 1ba39c
oldback=#695656
newback=#75502a

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
