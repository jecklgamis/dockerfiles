FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor curl dumb-init
RUN apt-get clean all

ENV BEATS_VERSION 7.4.2

RUN mkdir -p /usr/local/metricbeat
WORKDIR /usr/local/metricbeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    tar --strip-components=1  -xzvf metricbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    rm -f metricbeat-$BEATS_VERSION-linux-x86_64.tar.gz
COPY metricbeat.yml /usr/local/metricbeat/

RUN mkdir -p /usr/local/filebeat
WORKDIR /usr/local/filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    tar --strip-components=1  -xzvf filebeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    rm -f filebeat-$BEATS_VERSION-linux-x86_64.tar.gz
COPY filebeat.yml /usr/local/filebeat/

RUN mkdir -p /usr/local/packetbeat
WORKDIR /usr/local/packetbeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    tar --strip-components=1  -xzvf packetbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    rm -f packetbeat-$BEATS_VERSION-linux-x86_64.tar.gz
COPY packetbeat.yml /usr/local/packetbeat/

RUN mkdir -p /usr/local/heartbeat
WORKDIR /usr/local/heartbeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    tar --strip-components=1  -xzvf heartbeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    rm -f heartbeat-$BEATS_VERSION-linux-x86_64.tar.gz
COPY heartbeat.yml /usr/local/heartbeat/

RUN groupadd -r beats && useradd -r -gbeats beats
RUN chown -R beats:beats /usr/local/filebeat*
RUN chown -R beats:beats /usr/local/metricbeat*
RUN chown -R beats:beats /usr/local/heartbeat*

RUN mkdir -p /var/log/supervisor
COPY run-filebeat.sh /usr/local/bin
COPY run-metricbeat.sh /usr/local/bin
COPY run-packetbeat.sh /usr/local/bin
COPY run-heartbeat.sh /usr/local/bin
COPY beats-supervisor.conf /etc/supervisor/conf.d/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/supervisord"]


