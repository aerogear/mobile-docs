# download requirements

# curl https://raw.githubusercontent.com/finp/trello/master/modules/test/pages/test.adoc > modules/test/pages/rantora-test.adoc



# create html

antora $1

#fix html

./bin/fixDiv.sh


# utils
# touch files for antora
#  grep -o :.*.adoc modules/ROOT/nav.adoc |sed 's/:/touch /'
#