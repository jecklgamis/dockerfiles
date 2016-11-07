#!/bin/bash
set -ex
cd /usr/local/topbeat
exec ./topbeat -e -c topbeat.yml
