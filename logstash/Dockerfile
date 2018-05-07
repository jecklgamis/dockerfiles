FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl

ENV LOGSTASH_PKG_NAME logstash-6.2.4

RUN cd /usr/local && curl -O https://artifacts.elastic.co/downloads/logstash/$LOGSTASH_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $LOGSTASH_PKG_NAME.tar.gz
RUN ln -s /usr/local/$LOGSTASH_PKG_NAME /usr/local/logstash
COPY logstash.conf  /usr/local/logstash/bin

RUN groupadd -r logstash && useradd -r -glogstash logstash
RUN chown -R logstash:logstash /usr/local/logstash*

USER logstash
COPY run-logstash.sh /usr/local/bin
CMD ["/usr/local/bin/run-logstash.sh"]


