#!/usr/bin/env bash
set -e

if [ $# -lt 1 ]; then
	echo "Usage $0 <es.url>"
	exit 1
fi

ES_URL=$1

function wait_for_es() {
    local retries=5
    until $(curl --output /dev/null --silent --head --fail ${ES_URL}) ; do
        echo "Waiting for ${ES_URL}"
        sleep 5
        retries=$((retries-1))
        if [[ retries -eq 0 ]]; then
            echo "Unable to connect to ${ES_URL}. Giving up"
            exit -1
        fi
    done
}

function load_dashboards() {
    echo "Loading filebeat dashboards"
    /usr/local/filebeat/scripts/import_dashboards -es ${ES_URL} -file /usr/local/beats-dashboard.zip > /dev/null 2>&1
    echo "Loading metricbeat dashboards"
    /usr/local/metricbeat/scripts/import_dashboards -es ${ES_URL} -file /usr/local/beats-dashboard.zip  > /dev/null 2>&1
    echo "Loading packetbeat dashboards"
    /usr/local/packetbeat/scripts/import_dashboards -es ${ES_URL} -file /usr/local/beats-dashboard.zip  > /dev/null 2>&1
}

wait_for_es
load_dashboards