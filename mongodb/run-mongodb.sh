#!/bin/bash

set -ex

NAME=mongodb
CONF=/etc/mongodb.conf
DAEMON=/usr/bin/mongod
DESC=database
if [ -f /etc/default/${NAME} ] ; then
    . /etc/default/${NAME}
fi
. /lib/lsb/init-functions
DAEMONUSER=${DAEMONUSER:-mongodb}
DAEMON_OPTS=${DAEMON_OPTS:-"--unixSocketPrefix=$RUNDIR --config $CONF run"}
exec ${DAEMON}
