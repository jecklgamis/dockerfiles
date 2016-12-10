FROM ubuntu:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor curl couchdb

RUN mkdir -p /var/run/couchdb && chown -R couchdb:couchdb /var/run/couchdb
RUN mkdir -p /var/log/couchdb && chown -R couchdb:couchdb /var/log/couchdb

COPY run-couchdb.sh /usr/local/bin
COPY couchdb-supervisor.conf /etc/supervisor/conf.d/

RUN sed -i 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/g' /etc/couchdb/local.ini

CMD ["/usr/bin/supervisord"]


