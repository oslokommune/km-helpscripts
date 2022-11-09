#!/bin/sh
while read repo; do
    cd "repos/$repo"
    echo "####"
    echo "Repo: $repo"
    git grep $1
    cd ../../
done < repolist.txt
