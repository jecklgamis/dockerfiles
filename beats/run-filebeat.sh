#!/bin/bash
set -ex
cd /usr/local/filebeat
exec ./filebeat -e -c filebeat.yml

