FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG TARGETARCH
RUN apt update -y && apt install -y curl && apt clean all &&  rm -rf /var/lib/apt/lists/*

ENV LOGSTASH_VERSION=9.0.3

RUN LOGSTASH_ARCH=$(if [ "$TARGETARCH" = "arm64" ]; then echo aarch64; else echo x86_64; fi) \
    && LOGSTASH_PKG_NAME=logstash-${LOGSTASH_VERSION}-linux-$LOGSTASH_ARCH \
    && curl -fLO https://artifacts.elastic.co/downloads/logstash/$LOGSTASH_PKG_NAME.tar.gz \
    && tar xvf $LOGSTASH_PKG_NAME.tar.gz \
    && rm -f $LOGSTASH_PKG_NAME.tar.gz \
    && ln -s /logstash-$LOGSTASH_VERSION /logstash

COPY logstash.conf  /logstash/bin/

RUN groupadd -r logstash && useradd -r -glogstash logstash
RUN chown -R logstash:logstash /logstash*

USER logstash
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]


