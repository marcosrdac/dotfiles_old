#!/usr/bin/env bash
#	default color: 178984
oldglyph=#7a6c5d
newglyph=#496749

#	Front
#	default color: 36d7b7
oldfront=#cbb59b
newfront=#7db07d

#	Back
#	default color: 1ba39c
oldback=#8c7c6a
newback=#567956

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
