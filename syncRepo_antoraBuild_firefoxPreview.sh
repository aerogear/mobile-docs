#!/bin/bash
git remote add upstream git@github.com:aerogear/mobile-docs.git
git fetch upstream
git checkout master
git reset --hard upstream/master  
git push origin master --force
./bin/quick-build.sh local-site.yml && firefox build/site/index.html
