#!/usr/bin/env bash

sourceDir="../modules/ROOT/pages/"
destDir="../modules/ROOT/pages/"



for adoc in $sourceDir/*.adoc; do
  echo "$adoc"
  ./asciidoc-coalescer.rb $adoc > $adoc.tmp
done



