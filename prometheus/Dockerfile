FROM jecklgamis/openjdk-8-jre
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl
RUN apt clean all

ENV PROMETHEUS_VERSION 2.24.0
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

