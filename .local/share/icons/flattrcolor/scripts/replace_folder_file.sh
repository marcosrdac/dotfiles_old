#!/usr/bin/env bash
#	default color: 178984
oldglyph=#335463
newglyph=#765c30

#	Front
#	default color: 36d7b7
oldfront=#5b93ae
newfront=#cb9f54

#	Back
#	default color: 1ba39c
oldback=#3e6577
newback=#8c6d39

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
