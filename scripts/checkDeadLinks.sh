#!/bin/bash

# Collect all dead links in a file
find . -name \*.md -exec markdown-link-check -c ./scripts/config-check-broken-links.json {} \; 2>/dev/null | egrep "[✖]" > broken.txt

# Count the number of lines, extract only that number 
n_broken=`wc broken.txt --lines | cut -f 1 -d " "`
 
if [[ $n_broken > 0 ]] 
then
  echo "Number of broken files: "$n_broken
  cat broken.txt
  rm broken.txt
  exit $n_broken
fi

rm broken.txt

