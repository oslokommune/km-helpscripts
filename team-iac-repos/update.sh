#!/bin/sh
while read repo; do
    cd "repos/$repo"
    git checkout
    cd ../../
done < repolist.txt
