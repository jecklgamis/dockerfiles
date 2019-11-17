#!/bin/bash
set -ex
cd /usr/local/grafana
exec ./bin/grafana-server web

