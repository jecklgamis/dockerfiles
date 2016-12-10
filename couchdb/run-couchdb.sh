#!/bin/bash
set -ex

if test -f /etc/default/couchdb; then source /etc/default/couchdb; fi
if test -f /lib/lsb/init-functions; then source /lib/lsb/init-functions; fi
exec /usr/bin/couchdb

