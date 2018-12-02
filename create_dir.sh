#!/usr/bin/env bash
padded=`printf "%02d" $1`
mkdir -p src/${padded}
session=`cat session.txt`
curl 'https://adventofcode.com/2018/day/2/input' -H "cookie: session=${session}" > src/${padded}/input
printf "# done in:\n*\n\n# learnings:\n*\n\n# usage:\n\n# performance:\n" >> src/${padded}/README.md
