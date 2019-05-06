FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl

ENV PROMETHEUS_VERSION 2.9.2
ENV PROMETHEUS_HOME /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64

RUN cd /usr/local && \
    curl  -H 'Cache-Control: no-cache'  -fLO  \
    https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    tar xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    rm -f prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

COPY prometheus.yml ${PROMETHEUS_HOME}
COPY run-prometheus.sh /usr/local/bin

WORKDIR ${PROMETHEUS_HOME}
CMD ["/usr/local/bin/run-prometheus.sh"]

