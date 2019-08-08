#!/bin/bash
echo $SHELL
echo 'netlify-publish-adoc'
node_modules/.bin/antora --html-url-extension-style=indexify --pull ../antora-site.yml
 
echo 'node-publish-adoc'
gem install asciidoctor


for filename in ../modules/ROOT/pages/*.adoc; do

  echo $filename
  cat ../modules/ROOT/pages/_partials/attributes.adoc ../bin/downstream-attributes $filename > $filename.tmp
  ../bin/asciidoc-coalescer.rb -a include-tags="!excludeDownstream;!excludeAll" $filename.tmp > ../build/site/$(basename "$filename")
  asciidoctor -a include-tags="!excludeDownstream;!excludeAll" $filename.tmp > ../build/site/$(basename "$filename").html

done

cp -r ../etc ../build/site/
cp ../etc/index.html ../build/site/index.html
