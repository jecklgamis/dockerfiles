FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y mongodb && apt clean all && rm -rf /var/lib/apt/lists/*

COPY mongodb-supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /data/db /data/configdb && chown -R mongodb:mongodb /data/db /data/configdb

EXPOSE 27017

COPY run-mongodb.sh /usr/local/bin
CMD ["/usr/local/bin/run-mongodb.sh"]



