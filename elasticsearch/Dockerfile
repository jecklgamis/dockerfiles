FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG TARGETARCH
RUN apt update -y && apt install -y curl openjdk-21-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

ENV ES_VERSION=9.0.3
ENV ES_HOME=/elasticsearch

RUN mkdir -p $ES_HOME
RUN groupadd -r es && useradd -r -ges es

RUN ES_ARCH=$(if [ "$TARGETARCH" = "arm64" ]; then echo aarch64; else echo x86_64; fi) \
 && ES_PKG_NAME=elasticsearch-$ES_VERSION-linux-$ES_ARCH \
 && cd $ES_HOME && curl -LfO https://artifacts.elastic.co/downloads/elasticsearch/$ES_PKG_NAME.tar.gz \
 && tar --strip-components=1 -xvf $ES_PKG_NAME.tar.gz && rm -f $ES_PKG_NAME.tar.gz

RUN echo "transport.host: localhost" | tee -a $ES_HOME/config/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" | tee -a $ES_HOME/config/elasticsearch.yml
RUN echo "xpack.security.enabled: false" | tee -a $ES_HOME/config/elasticsearch.yml

EXPOSE 9200
EXPOSE 9300

RUN chown -R es:es $ES_HOME

USER es
WORKDIR $ES_HOME
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]


