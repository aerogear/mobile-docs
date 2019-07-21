
echo 'netlify-publish-adoc'
node_modules/.bin/antora --html-url-extension-style=indexify --pull ../antora-site.yml
./bin/publish-adoc > build/site/ds-audit.adoc
