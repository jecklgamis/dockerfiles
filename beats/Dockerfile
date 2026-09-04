FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG TARGETARCH
RUN apt update -y && apt install -y supervisor curl dumb-init  && apt clean all && rm -rf /var/lib/apt/lists/*

ENV BEATS_VERSION=9.0.3
RUN echo "$(if [ "$TARGETARCH" = "arm64" ]; then echo arm64; else echo x86_64; fi)" > /tmp/beats_arch

RUN mkdir -p /metricbeat
WORKDIR /metricbeat
RUN BEATS_ARCH=$(cat /tmp/beats_arch) && curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    tar --strip-components=1  -xzvf metricbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    rm -f metricbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz
COPY metricbeat.yml /metricbeat/

RUN mkdir -p /filebeat
WORKDIR /filebeat
RUN BEATS_ARCH=$(cat /tmp/beats_arch) && curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    tar --strip-components=1  -xzvf filebeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    rm -f filebeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz
COPY filebeat.yml /filebeat/

RUN mkdir -p /packetbeat
WORKDIR /packetbeat
RUN BEATS_ARCH=$(cat /tmp/beats_arch) && curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    tar --strip-components=1  -xzvf packetbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    rm -f packetbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz
COPY packetbeat.yml /packetbeat/

RUN mkdir -p /heartbeat
WORKDIR /heartbeat
RUN BEATS_ARCH=$(cat /tmp/beats_arch) && curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    tar --strip-components=1  -xzvf heartbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz && \
    rm -f heartbeat-$BEATS_VERSION-linux-$BEATS_ARCH.tar.gz
COPY heartbeat.yml /heartbeat/
RUN rm -f /tmp/beats_arch

RUN groupadd -r beats && useradd -r -gbeats beats
RUN chown -R beats:beats /filebeat*
RUN chown -R beats:beats /metricbeat*
RUN chown -R beats:beats /heartbeat*

RUN mkdir -p /var/log/supervisor
COPY run-filebeat.sh /bin
COPY run-metricbeat.sh /bin
COPY run-packetbeat.sh /bin
COPY run-heartbeat.sh /bin
COPY beats-supervisor.conf /etc/supervisor/conf.d/

WORKDIR /
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/supervisord"]


