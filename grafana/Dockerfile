FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y curl && apt clean all && rm -rf /var/lib/apt/lists/*

ENV GRAFANA_VERSION=12.0.2
ENV GRAFANA_HOME=/grafana

RUN cd / && curl -L -O https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz && \
    tar xvf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz && rm -f grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz
RUN ln -s /grafana-v$GRAFANA_VERSION $GRAFANA_HOME

RUN groupadd -r grafana && useradd -r -ggrafana grafana
RUN chown -R grafana:grafana $GRAFANA_HOME/bin

WORKDIR /grafana
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]


