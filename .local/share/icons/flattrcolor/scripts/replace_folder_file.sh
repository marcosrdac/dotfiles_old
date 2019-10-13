#!/usr/bin/env bash
#	default color: 178984
oldglyph=#496749
newglyph=#773436

#	Front
#	default color: 36d7b7
oldfront=#7db07d
newfront=#cb5b5d

#	Back
#	default color: 1ba39c
oldback=#567956
newback=#8c3e40

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
