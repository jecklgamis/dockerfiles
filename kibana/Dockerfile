FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor wget curl

ENV KIBANA_PKG_NAME kibana-5.0.0-linux-x86_64

RUN cd /usr/local && wget https://artifacts.elastic.co/downloads/kibana/$KIBANA_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $KIBANA_PKG_NAME.tar.gz && rm -f  $KIBANA_PKG_NAME.tar.gz
RUN ln -s /usr/local/$KIBANA_PKG_NAME /usr/local/kibana

ENV ES_URL http://es.local:9200
ENV ES_USER user
ENV ES_PASSWORD password

RUN echo "elasticsearch.url: \"$ES_URL\"" | tee -a /usr/local/kibana/config/kibana.yml
RUN echo "elasticsearch.username: \"$ES_USER\"" | tee -a /usr/local/kibana/config/kibana.yml
RUN echo "elasticsearch.password: \"$ES_PASSWORD\"" | tee -a /usr/local/kibana/config/kibana.yml
RUN echo "server.host: \"0.0.0.0\"" | tee -a /usr/local/kibana/config/kibana.yml

RUN groupadd -r kibana && useradd -r -gkibana kibana
RUN chown -R kibana:kibana /usr/local/kibana/bin
RUN chown -R kibana:kibana /usr/local/kibana/optimize

RUN mkdir -p /var/log/supervisor
COPY run-kibana.sh /usr/local/bin
COPY kibana-supervisor.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]


