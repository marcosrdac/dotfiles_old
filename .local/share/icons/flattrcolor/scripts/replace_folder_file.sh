#!/usr/bin/env bash
#	default color: 178984
oldglyph=#6b472d
newglyph=#5c4c23

#	Front
#	default color: 36d7b7
oldfront=#bc7d4e
newfront=#a68a40

#	Back
#	default color: 1ba39c
oldback=#815636
newback=#725f2c

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
