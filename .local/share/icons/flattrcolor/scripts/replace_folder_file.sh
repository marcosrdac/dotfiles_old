#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4f3c35
newglyph=#4a5640

#	Front
#	default color: 36d7b7
oldfront=#8f6c5f
newfront=#829770

#	Back
#	default color: 1ba39c
oldback=#624a41
newback=#59684d

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
