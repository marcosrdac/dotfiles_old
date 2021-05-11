#!/bin/sh

# getting output of last
last_out=`last -ia -10000`

# organizing data for later queries
table=`echo "$last_out" | head -n -2 | awk 'BEGIN {FIELDWIDTHS = "8 12 40 255"} {print $4"\t"$1}'`

# getting unique hosts list
hosts=`echo "$table" | awk -F'\t' '{ print $1 }' | sort | uniq -c`

# for each host do
echo "$hosts" | while read -r M host
do
  echo "$host: $M"
  users=`echo "$table" | awk -F'\t' -v HOST=$host '{ if ($1 == HOST) print $2 }' | sort | uniq -c`
  echo "$users" | awk '{ print "    "$2" "$1 }'
  echo
done
