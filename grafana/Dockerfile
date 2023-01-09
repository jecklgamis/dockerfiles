FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl && apt clean all && rm -rf /var/lib/apt/lists/*

ENV GRAFANA_PKG_NAME grafana-9.3.2
RUN cd /usr/local && curl -L -O https://dl.grafana.com/oss/release/$GRAFANA_PKG_NAME.linux-amd64.tar.gz && \
    tar xvf $GRAFANA_PKG_NAME.linux-amd64.tar.gz && rm -f $GRAFANA_PKG_NAME.linux-amd64.tar.gz
RUN ln -s /usr/local/$GRAFANA_PKG_NAME /usr/local/grafana

RUN groupadd -r grafana && useradd -r -ggrafana grafana
RUN chown -R grafana:grafana /usr/local/grafana/bin

COPY run-grafana.sh /usr/local/bin
CMD ["/usr/local/bin/run-grafana.sh"]


