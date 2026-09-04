#!/bin/bash
set -ex
cd /filebeat
exec ./filebeat -e -c filebeat.yml

