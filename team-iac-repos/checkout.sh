#!/bin/sh
while read repo; do
    git clone "https://github.com/oslokommune/$repo" "repos/$repo"
done < repolist.txt
