FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor wget

ENV ES_PKG_NAME elasticsearch-5.0.0

RUN cd /usr/local && wget https://artifacts.elastic.co/downloads/elasticsearch/$ES_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $ES_PKG_NAME.tar.gz && rm -f  $ES_PKG_NAME.tar.gz
RUN ln -s /usr/local/$ES_PKG_NAME /usr/local/elasticsearch
RUN echo "network.host: 0.0.0.0" | tee -a /usr/local/elasticsearch/config/elasticsearch.yml

RUN groupadd -r es && useradd -r -ges es
RUN chown -R es:es /usr/local/elasticsearch*

EXPOSE 9200
EXPOSE 9300

RUN mkdir -p /var/log/supervisor
COPY run-elasticsearch.sh /usr/local/bin
COPY elasticsearch-supervisor.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]


