FROM jecklgamis/openjdk-8-jre
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y curl
RUN apt clean all

ENV LOGSTASH_PKG_NAME logstash-7.10.2-linux-x86_64

RUN cd /usr/local && curl -O https://artifacts.elastic.co/downloads/logstash/$LOGSTASH_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $LOGSTASH_PKG_NAME.tar.gz && rm -f $LOGSTASH_PKG_NAME
RUN ln -s /usr/local/$LOGSTASH_PKG_NAME /usr/local/logstash
COPY logstash.conf  /usr/local/logstash/bin

RUN groupadd -r logstash && useradd -r -glogstash logstash
RUN chown -R logstash:logstash /usr/local/logstash*

USER logstash
COPY run-logstash.sh /usr/local/bin
CMD ["/usr/local/bin/run-logstash.sh"]


