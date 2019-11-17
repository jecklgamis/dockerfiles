FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl dumb-init gnupg2
RUN curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc| apt-key add -
RUN echo "deb https://apache.bintray.com/couchdb-deb bionic main" | tee -a /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y couchdb

RUN mkdir -p /var/run/couchdb && chown -R couchdb:couchdb /var/run/couchdb
RUN mkdir -p /var/log/couchdb && chown -R couchdb:couchdb /var/log/couchdb

RUN sed -i 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/g' /opt/couchdb/etc/local.ini

COPY run-couchdb.sh /usr/local/bin

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run-couchdb.sh"]


