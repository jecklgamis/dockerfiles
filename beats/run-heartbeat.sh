#!/bin/bash
set -ex
cd /usr/local/heartbeat
exec ./heartbeat -e -c heartbeat.yml

