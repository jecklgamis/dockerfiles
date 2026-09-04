#!/bin/bash
set -ex
cd /packetbeat
exec ./packetbeat -e -c packetbeat.yml
