#!/usr/bin/env bash
#	default color: 178984
oldglyph=#2f5871
newglyph=#783c57

#	Front
#	default color: 36d7b7
oldfront=#5298c4
newfront=#cb6894

#	Back
#	default color: 1ba39c
oldback=#386987
newback=#8c4766

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
