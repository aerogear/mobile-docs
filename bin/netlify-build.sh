
echo 'netlify-publish-adoc'
node_modules/.bin/antora --html-url-extension-style=indexify --pull ../antora-site.yml

# ../bin/publish-adoc.sh > build/site/ds-audit.adoc

echo 'node-publish-adoc'
node ../bin/index.js ../modules/ROOT/pages/ds-audit.adoc