
echo 'netlify-publish-adoc'
node_modules/.bin/antora --html-url-extension-style=indexify --pull ../antora-site.yml

echo 'node-publish-adoc'

gem install asciidoctor

for filename in ../modules/ROOT/pages/*.adoc; do

   echo $filename
  ../bin/asciidoc-coalescer.rb $filename > ../build/site/$(basename "$filename")

done
