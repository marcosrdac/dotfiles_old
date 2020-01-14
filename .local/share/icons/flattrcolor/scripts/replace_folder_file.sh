#!/usr/bin/env bash
#	default color: 178984
oldglyph=#783c57
newglyph=#06161e

#	Front
#	default color: 36d7b7
oldfront=#cb6894
newfront=#123c50

#	Back
#	default color: 1ba39c
oldback=#8c4766
newback=#0c2937

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
