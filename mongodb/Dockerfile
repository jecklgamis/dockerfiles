FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y mongodb
COPY mongodb-supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /data/db /data/configdb && chown -R mongodb:mongodb /data/db /data/configdb

EXPOSE 27017

COPY run-mongodb.sh /usr/local/bin
CMD ["/usr/local/bin/run-mongodb.sh"]



