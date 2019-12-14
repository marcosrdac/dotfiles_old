#!/usr/bin/env bash
#	default color: 178984
oldglyph=#61414c
newglyph=#7a6c5d

#	Front
#	default color: 36d7b7
oldfront=#a77284
newfront=#cbb59b

#	Back
#	default color: 1ba39c
oldback=#734e5a
newback=#8c7c6a

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
