#!/bin/bash
ZOOKEEPER_HOME=${ZOOKEEPER_HOME:-/zookeeper}

cd ${ZOOKEEPER_HOME}
exec bin/zkServer.sh start-foreground
