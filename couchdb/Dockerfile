FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update && apt install -y curl apt-transport-https gnupg dumb-init && apt clean all && rm -rf /var/lib/apt/lists/*
ENV COUCHDB_VERSION=3.5.2.1~noble

RUN curl https://couchdb.apache.org/repo/keys.asc | gpg --dearmor | tee /usr/share/keyrings/couchdb-archive-keyring.gpg > /dev/null 2>&1
RUN . /etc/os-release
RUN echo "deb [signed-by=/usr/share/keyrings/couchdb-archive-keyring.gpg] https://apache.jfrog.io/artifactory/couchdb-deb/ noble main" \
    | tee /etc/apt/sources.list.d/couchdb.list >/dev/null

RUN echo "couchdb couchdb/mode select standalone" | debconf-set-selections \
    && echo "couchdb couchdb/bindaddress string 0.0.0.0" | debconf-set-selections \
    && echo "couchdb couchdb/cookie string couchdb" | debconf-set-selections \
    && echo "couchdb couchdb/adminpass password admin" | debconf-set-selections \
    && echo "couchdb couchdb/adminpass_again password admin" | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y couchdb=$COUCHDB_VERSION && apt clean all && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/couchdb && chown -R couchdb:couchdb /var/run/couchdb
RUN mkdir -p /var/log/couchdb && chown -R couchdb:couchdb /var/log/couchdb

RUN sed -i 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/g' /opt/couchdb/etc/local.ini

COPY run-couchdb.sh /usr/local/bin

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run-couchdb.sh"]


