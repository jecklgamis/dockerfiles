FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl openjdk-8-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

ENV ZOOKEEPER_VERSION 3.8.0
ENV ZOOKEEPER_HOME /zookeeper

RUN curl -H 'Cache-Control: no-cache'  -fLO  https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
    tar xvf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && ln -s /apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME} && \
    rm -f apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

COPY zoo.cfg ${ZOOKEEPER_HOME}/conf

COPY run-zookeeper.sh /
WORKDIR ${ZOOKEEPER_HOME}
CMD ["/run-zookeeper.sh"]

