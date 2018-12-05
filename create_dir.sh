#!/usr/bin/env bash
padded=`printf "%02d" $1`
mkdir -p src/${padded}
session=`cat session.txt`
curl "https://adventofcode.com/2018/day/${1}/input" -H "cookie: session=${session}" > src/${padded}/input
printf "# done in:\n*\n\n# learnings:\n*\n\n# usage:\n## 01\n\n## 02\n\n# performance:\n## 01\n\n## 02\n\n\n" >> src/${padded}/README.md
