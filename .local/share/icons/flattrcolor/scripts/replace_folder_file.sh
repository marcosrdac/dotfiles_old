#!/usr/bin/env bash
#	default color: 178984
oldglyph=#153225
newglyph=#635342

#	Front
#	default color: 36d7b7
oldfront=#2c6a4e
newfront=#aa8f73

#	Back
#	default color: 1ba39c
oldback=#1e4835
newback=#75624f

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
