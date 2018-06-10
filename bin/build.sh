# Build website
#
# Run from root level of repo, eg ./bin/build.sh local-site.yml

# get files from other repos using ruby version of asciidoctor

./bin/ant-include.sh

# generate html

antora $1

# fix html

./bin/fix-div.sh
