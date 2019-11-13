for filename in ../modules/ROOT/pages/*.adoc; do

   echo $filename
  ../bin/asciidoc-coalescer.rb -a include-tags='!excludeDownstream;!excludeAll' $filename > ../build/site/$(basename "$filename")

done
