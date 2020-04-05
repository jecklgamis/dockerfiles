#!/bin/bash
if [ -r /etc/default/nginx ]; then
  . /etc/default/nginx
fi
. /lib/init/vars.sh
. /lib/lsb/init-functions
exec /usr/sbin/nginx
