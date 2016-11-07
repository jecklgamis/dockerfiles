#!/bin/bash
set -ex
cd /usr/local/packetbeat
exec ./packetbeat -e -c packetbeat.yml
