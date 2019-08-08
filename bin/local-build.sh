for filename in ../modules/ROOT/pages/*.adoc; do

  echo $filename
  cat ../bin/downstream-attributes $filename > $filename.tmp
  ../bin/asciidoc-coalescer.rb -a include-tags="!excludeDownstream;!excludeAll" $filename.tmp > ../build/site/$(basename "$filename")

done
