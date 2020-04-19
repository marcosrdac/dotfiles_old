#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4c333d
newglyph=#2b3e40

#	Front
#	default color: 36d7b7
oldfront=#895c6f
newfront=#507479

#	Back
#	default color: 1ba39c
oldback=#5e3f4c
newback=#375053

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
