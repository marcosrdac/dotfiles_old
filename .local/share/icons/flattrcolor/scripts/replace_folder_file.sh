#!/usr/bin/env bash
#	default color: 178984
oldglyph=#643b6c
newglyph=#1d4154

#	Front
#	default color: 36d7b7
oldfront=#ae66ba
newfront=#35799b

#	Back
#	default color: 1ba39c
oldback=#774680
newback=#25536b

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
