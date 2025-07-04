#!/bin/bash

KAFKA_HOME=${KAFKA_HOME:-/kafka}
KAFKA_PORT=${KAFKA_PORT:-7080}

KAFKA_CLUSTER_ID="$($KAFKA_HOME/bin/kafka-storage.sh random-uuid)"
$KAFKA_HOME/bin/kafka-storage.sh format --standalone -t $KAFKA_CLUSTER_ID -c ${KAFKA_HOME}/config/server.properties

exec ${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties
