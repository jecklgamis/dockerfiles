#!/bin/bash
set -ex

KAFKA_HOME=${KAFKA_HOME:-/kafka}
KAFKA_PORT=${KAFKA_PORT:-7080}

cd ${KAFKA_HOME}
exec ${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties
