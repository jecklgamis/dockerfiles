FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl dumb-init
RUN apt-get clean all

ENV ES_HOME /usr/local/elasticsearch
ENV ES_PKG_NAME elasticsearch-7.4.2-linux-x86_64

RUN mkdir -p $ES_HOME
RUN groupadd -r es && useradd -r -ges es
RUN chown -R es:es $ES_HOME

USER es
WORKDIR $ES_HOME
RUN curl -LfO https://artifacts.elastic.co/downloads/elasticsearch/$ES_PKG_NAME.tar.gz
RUN tar --strip-components=1 -xvf $ES_PKG_NAME.tar.gz && rm -f  $ES_PKG_NAME.tar.gz

RUN echo "transport.host: localhost" | tee -a $ES_HOME/config/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" | tee -a $ES_HOME/config/elasticsearch.yml

EXPOSE 9200
EXPOSE 9300

COPY run-elasticsearch.sh /usr/local/bin
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run-elasticsearch.sh"]


