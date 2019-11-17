#!/bin/bash
set -ex

if test -f /lib/lsb/init-functions; then source /lib/lsb/init-functions; fi
exec /opt/couchdb/bin/couchdb

