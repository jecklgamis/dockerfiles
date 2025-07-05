FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ENV MONGODB_VERSION=8.0.10
RUN apt update -y && apt install -y gnupg curl

RUN curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor

RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-8.0.list

RUN apt update -y && apt install -y \
   mongodb-org=$MONGODB_VERSION \
   mongodb-org-database=$MONGODB_VERSION \
   mongodb-org-server=$MONGODB_VERSION \
   mongodb-mongosh \
   mongodb-org-shell=$MONGODB_VERSION \
   mongodb-org-mongos=$MONGODB_VERSION \
   mongodb-org-tools=$MONGODB_VERSION \
   mongodb-org-database-tools-extra=$MONGODB_VERSION \
   && apt clean all && rm -rf /var/lib/apt/lists/*

COPY mongodb-supervisor.conf /etc/supervisor/conf.d/
RUN mkdir -p /data/db /data/configdb && chown -R mongodb:mongodb /data/db /data/configdb

EXPOSE 27017

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]



