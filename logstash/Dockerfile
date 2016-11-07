FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor wget

ENV LOGSTASH_PKG_NAME logstash-2.4.0

RUN cd /usr/local && wget https://download.elastic.co/logstash/logstash/$LOGSTASH_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $LOGSTASH_PKG_NAME.tar.gz
RUN ln -s /usr/local/$LOGSTASH_PKG_NAME /usr/local/logstash
COPY logstash.conf  /usr/local/logstash/bin

RUN groupadd -r logstash && useradd -r -glogstash logstash
RUN chown -R logstash:logstash /usr/local/logstash*

RUN mkdir -p /var/log/supervisor
COPY run-logstash.sh /usr/local/bin
COPY logstash-supervisor.conf /etc/supervisor/conf.d/


CMD ["/usr/bin/supervisord"]


