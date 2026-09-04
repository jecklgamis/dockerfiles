#!/bin/bash
set -ex
cd /heartbeat
exec ./heartbeat -e -c heartbeat.yml

