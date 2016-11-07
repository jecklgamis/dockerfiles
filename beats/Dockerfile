FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor wget curl nodejs

ENV FILEBEAT_PKG_NAME filebeat-5.0.0-linux-x86_64
RUN cd /usr/local && wget https://artifacts.elastic.co/downloads/beats/filebeat/$FILEBEAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $FILEBEAT_PKG_NAME.tar.gz && rm -f  $FILEBEAT_PKG_NAME.tar.gz
 RUN ln -s /usr/local/$FILEBEAT_PKG_NAME /usr/local/filebeat
COPY filebeat.yml  /usr/local/filebeat/

ENV PACKETBEAT_PKG_NAME packetbeat-5.0.0-linux-x86_64
RUN cd /usr/local && wget https://artifacts.elastic.co/downloads/beats/packetbeat/$PACKETBEAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $PACKETBEAT_PKG_NAME.tar.gz && rm -f  $PACKETBEAT_PKG_NAME.tar.gz
RUN ln -s /usr/local/$PACKETBEAT_PKG_NAME /usr/local/packetbeat
COPY packetbeat.yml  /usr/local/packetbeat/

ENV METRICBEAT_PKG_NAME metricbeat-5.0.0-linux-x86_64
RUN cd /usr/local && wget https://artifacts.elastic.co/downloads/beats/metricbeat/$METRICBEAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $METRICBEAT_PKG_NAME.tar.gz && rm -f  $METRICBEAT_PKG_NAME.tar.gz
RUN ln -s /usr/local/$METRICBEAT_PKG_NAME /usr/local/metricbeat
COPY metricbeat.yml  /usr/local/metricbeat/

ENV TOPBEAT_PKG_NAME topbeat-1.3.1-x86_64
RUN cd /usr/local && wget https://download.elastic.co/beats/topbeat/$TOPBEAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $TOPBEAT_PKG_NAME.tar.gz && rm -f  $TOPBEAT_PKG_NAME.tar.gz
RUN ln -s /usr/local/$TOPBEAT_PKG_NAME /usr/local/topbeat
COPY topbeat.yml  /usr/local/topbeat/

RUN groupadd -r beats && useradd -r -gbeats beats
RUN chown -R beats:beats /usr/local/filebeat*
RUN chown -R beats:beats /usr/local/metricbeat*
RUN chown -R beats:beats /usr/local/topbeat*
RUN chown -R beats:beats /usr/local/packetbeat*

RUN mkdir -p /var/log/supervisor
COPY run-topbeat.sh /usr/local/bin
COPY run-filebeat.sh /usr/local/bin
COPY run-metricbeat.sh /usr/local/bin
COPY run-packetbeat.sh /usr/local/bin
COPY beats-supervisor.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]


