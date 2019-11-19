#!/bin/bash
set -ex
cd /usr/local/metricbeat
SYSTEM_HOST_FS=${SYSTEM_HOST_FS:-/}
echo "SYSTEM_HOST_FS = ${SYSTEM_HOST_FS}"

./metricbeat modules enable system
exec ./metricbeat -v -e -c metricbeat.yml -system.hostfs=${SYSTEM_HOST_FS}

