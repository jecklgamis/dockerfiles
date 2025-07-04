FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y curl  openjdk-21-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

ENV KAFKA_VERSION=4.0.0
ENV KAFKA_HOME=/kafka

RUN curl -H 'Cache-Control: no-cache' -fLO https://dlcdn.apache.org/kafka/${KAFKA_VERSION}/kafka_2.13-${KAFKA_VERSION}.tgz && \
    tar xvf kafka_2.13-${KAFKA_VERSION}.tgz && ln -s /kafka_2.13-${KAFKA_VERSION} ${KAFKA_HOME} && \
    rm -f kafka_2.13-${KAFKA_VERSION}.tgz

RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/g' ${KAFKA_HOME}/config/server.properties
COPY docker-entrypoint.sh /

WORKDIR $KAFKA_HOME
CMD ["/docker-entrypoint.sh"]

