#!/usr/bin/env bash
padded=`printf "%02d" $1`
mkdir -p src/${padded}
sessin=`cat session.txt`
curl "https://adventofcode.com/2018/day/${1}/input" -H "cookie: session=${session}" > src/${padded}/input
printf "# done in:\n*\n\n# learnings:\n*\n\n# usage:\n\n# performance:\n" >> src/${padded}/README.md
