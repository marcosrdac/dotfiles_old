#!/usr/bin/env bash
#	default color: 178984
oldglyph=#5c1c5a
newglyph=#5f550e

#	Front
#	default color: 36d7b7
oldfront=#a934a4
newfront=#b29f1a

#	Back
#	default color: 1ba39c
oldback=#742371
newback=#7a6d12

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
