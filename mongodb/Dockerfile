FROM jecklgamis/openjdk-8-jre
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y mongodb
RUN apt clean all

COPY mongodb-supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /data/db /data/configdb && chown -R mongodb:mongodb /data/db /data/configdb

EXPOSE 27017

COPY run-mongodb.sh /usr/local/bin
CMD ["/usr/local/bin/run-mongodb.sh"]



