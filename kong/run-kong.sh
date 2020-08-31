#!/bin/bash
set -ex
exec /usr/local/bin/kong start -c /etc/kong/kong.conf -v
