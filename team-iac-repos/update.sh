#!/bin/sh
while read repo; do
    cd "repos/$repo"
    git pull
    cd ../../
done < repolist.txt
