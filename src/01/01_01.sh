#!/usr/bin/env bash
current=0
while read line; do
    arith=${line:0:1}
    value=${line#*$arith}
    current=`expr ${current} ${arith} ${value}`
done
echo "frequency after changes: ${current}"
