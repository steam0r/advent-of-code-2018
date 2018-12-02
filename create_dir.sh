#!/usr/bin/env bash
padded=`printf "%02d" $1`
mkdir -p src/${padded}
wget -O src/${padded}/input https://adventofcode.com/2018/day/$1/input
printf "# done in:\n*\n\n#learnings:\n*\n\n#usage:\n\n#performance:\n" >> src/${padded}/README.md
