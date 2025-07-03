FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y curl dumb-init gnupg2
RUN curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc| apt-key add -
RUN echo "deb https://apache.bintray.com/couchdb-deb bionic main" | tee -a /etc/apt/sources.list
RUN apt update -y && apt install -y couchdb
RUN apt clean all

RUN mkdir -p /var/run/couchdb && chown -R couchdb:couchdb /var/run/couchdb
RUN mkdir -p /var/log/couchdb && chown -R couchdb:couchdb /var/log/couchdb

RUN sed -i 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/g' /opt/couchdb/etc/local.ini

COPY run-couchdb.sh /usr/local/bin

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run-couchdb.sh"]


