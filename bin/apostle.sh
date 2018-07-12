# create build/*.adoc files for analysis

cd modules/ROOT/pages/

for i in getting-started.adoc con_services.adoc device-security.adoc getting-started.adoc identity-management.adoc mobile-cicd.adoc mobile-clients.adoc mobile-metrics.adoc push-notifications.adoc ref_api.adoc runtime-connector.adoc showcase-apps.adoc; do
    
    inc_path=$i
    echo $inc_path

    ruby ../../../bin/asciidoc-coalescer.rb -a partialsdir=_partials -a allow-uri-read $inc_path > $inc_path.tmp
done