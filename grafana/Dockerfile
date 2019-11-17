FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl

ENV GRAFANA_PKG_NAME grafana-6.4.4
RUN cd /usr/local && curl -L -O https://dl.grafana.com/oss/release/$GRAFANA_PKG_NAME.linux-amd64.tar.gz && \
    tar xvf $GRAFANA_PKG_NAME.linux-amd64.tar.gz && rm -f $GRAFANA_PKG_NAME.linux-amd64.tar.gz
RUN ln -s /usr/local/$GRAFANA_PKG_NAME /usr/local/grafana

RUN groupadd -r grafana && useradd -r -ggrafana grafana
RUN chown -R grafana:grafana /usr/local/grafana/bin

COPY run-grafana.sh /usr/local/bin
CMD ["/usr/local/bin/run-grafana.sh"]


