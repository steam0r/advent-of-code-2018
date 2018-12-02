#!/usr/bin/env bash
current=0
seen=(0)
count=1
outercount=0
changes=()
while read line; do
    changes+=($line)
done

while true; do
    for line in ${changes[@]}; do
        arith=${line:0:1}
        value=${line#*$arith}
        current=`expr ${current} ${arith} ${value}`
        if [[ " ${seen[*]} " == *" ${current} "* ]]; then
                echo "already know frequency ${current}"
                exit 0
        fi
        seen[${count}]=${current}
        let count+=1
    done
    let outercount+=1
done