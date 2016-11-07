#!/bin/bash

set -ex
if test -f /etc/apache2/envvars; then source /etc/apache2/envvars; fi
rm -rf /var/run/apache2/*ssl_scache*
rm -rf /var/run/apache2/apache2.pid
exec /usr/sbin/apache2 -DFOREGROUND -d /etc/apache2
