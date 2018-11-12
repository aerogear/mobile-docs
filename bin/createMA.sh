#!/usr/bin/env bash

sourceDir="../modules/ROOT/pages/"
destDir="../modules/ROOT/pages/"

ls -1 ../modules/ROOT/pages/*.adoc | grep -v attributes > listAll.txt


while read p; do
  echo "$p"
  
  pbase=`echo ${p%.*}`
  ./asciidoc-coalescer.rb --ATTRIBUTE=location=local $p > $p.asciidoc
done <listAll.txt

