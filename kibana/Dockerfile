FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG TARGETARCH
RUN apt update -y && apt install -y curl fontconfig openjdk-21-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

ENV KIBANA_VERSION=9.0.3
RUN groupadd -r kibana && useradd -r -gkibana kibana

ENV KIBANA_HOME=/usr/local/kibana
RUN mkdir -p $KIBANA_HOME && chown kibana:kibana $KIBANA_HOME
WORKDIR $KIBANA_HOME

USER kibana
RUN KIBANA_ARCH=$(if [ "$TARGETARCH" = "arm64" ]; then echo aarch64; else echo x86_64; fi) \
 && KIBANA_PKG_NAME=kibana-$KIBANA_VERSION-linux-$KIBANA_ARCH \
 && curl -LfO https://artifacts.elastic.co/downloads/kibana/$KIBANA_PKG_NAME.tar.gz \
 && tar --strip-components=1 -xvf $KIBANA_PKG_NAME.tar.gz && rm -f $KIBANA_PKG_NAME.tar.gz

ENV ES_URL=http://es.local:9200
ENV ES_USER=user
ENV ES_PASSWORD=password

RUN echo "elasticsearch.hosts: [\"${ES_URL}\"]" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "elasticsearch.username: \"$ES_USER\"" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "elasticsearch.password: \"$ES_PASSWORD\"" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "server.host: \"0.0.0.0\"" | tee -a ${KIBANA_HOME}/config/kibana.yml

EXPOSE 5601

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
