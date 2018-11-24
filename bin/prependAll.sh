#!/usr/bin/env bash

sourceDir="../modules/ROOT/pages/_partials"

for adoc in $sourceDir/*.adoc; do
    echo $adoc
    sed -i "1i\// includedFile $adoc" "$adoc"
done




