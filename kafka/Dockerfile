FROM jecklgamis/openjdk-8-jre:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl
RUN apt clean all

ENV KAFKA_VERSION 2.7.0
ENV KAFKA_HOME  /kafka

RUN curl -H 'Cache-Control: no-cache' -fLO http://apache.mirror.serversaustralia.com.au/kafka/${KAFKA_VERSION}/kafka_2.12-${KAFKA_VERSION}.tgz && \
    tar xvf kafka_2.12-${KAFKA_VERSION}.tgz && ln -s /kafka_2.12-${KAFKA_VERSION} ${KAFKA_HOME} && \
    rm -f kafka_2.12-${KAFKA_VERSION}.tgz

RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/g' ${KAFKA_HOME}/config/server.properties
COPY run-kafka.sh /

WORKDIR ${KAFKA_HOME}
CMD ["/run-kafka.sh"]

