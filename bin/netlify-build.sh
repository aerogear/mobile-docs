
echo 'netlify-publish-adoc'
node_modules/.bin/antora --html-url-extension-style=indexify --pull ../antora-site.yml
/opt/build/repo/bin/publish-adoc > /opt/build/repo/build/site/ds-audit.adoc
