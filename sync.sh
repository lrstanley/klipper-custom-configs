#!/bin/bash

BASE=$(dirname "$(readlink -f "$0")")
source "${BASE}/lib/includes"


cd "$BASE"

git config --global user.email "me@liamstanley.io"
git config --global user.name "Liam Stanley"

git add --all && git commit -m "$(hostname -f)" && git push -u origin master
git pull origin master
