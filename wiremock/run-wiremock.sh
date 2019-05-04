#!/bin/bash
set -ex

WIREMOCK_HOME=${WIREMOCK_HOME:-/usr/local/wiremock}
WIREMOCK_PORT=${WIREMOCK_PORT:-7080}

cd ${WIREMOCK_HOME}

WIREMOCK_ARGS="${WIREMOCK_ARGS} --container-threads=1024 \
--port=${WIREMOCK_PORT} \
--local-response-templating \
--no-request-journal \
--jetty-acceptor-threads=4 \
--async-response-enabled=true \
--async-response-threads=64"

JAVA_OPTS="-server \
-Xms1G \
-Xmx1G"

JAVA_OPTS="-cp ${WIREMOCK_HOME}/wiremock-standalone-${WIREMOCK_VERSION}.jar ${JAVA_OPTS}"
exec java ${JAVA_OPTS} com.github.tomakehurst.wiremock.standalone.WireMockServerRunner ${WIREMOCK_ARGS}