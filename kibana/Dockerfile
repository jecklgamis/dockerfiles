FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl dumb-init
RUN apt-get update -y && apt-get install -y fontconfig
RUN apt-get clean all

ENV KIBANA_PKG_NAME kibana-7.4.2-linux-x86_64
RUN groupadd -r kibana && useradd -r -gkibana kibana

ENV KIBANA_HOME /usr/local/kibana
RUN mkdir -p $KIBANA_HOME && chown kibana:kibana $KIBANA_HOME
WORKDIR $KIBANA_HOME

USER kibana
RUN curl -LfO https://artifacts.elastic.co/downloads/kibana/$KIBANA_PKG_NAME.tar.gz
RUN tar --strip-components=1 -xvf $KIBANA_PKG_NAME.tar.gz && rm -f $KIBANA_PKG_NAME.tar.gz

ENV ES_URL http://es.local:9200
ENV ES_USER user
ENV ES_PASSWORD password

RUN echo "elasticsearch.hosts: ["${ES_URL}"]" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "elasticsearch.username: \"$ES_USER\"" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "elasticsearch.password: \"$ES_PASSWORD\"" | tee -a ${KIBANA_HOME}/config/kibana.yml
RUN echo "server.host: \"0.0.0.0\"" | tee -a ${KIBANA_HOME}/config/kibana.yml

COPY run-kibana.sh /
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/run-kibana.sh"]
