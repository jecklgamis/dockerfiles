FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y apache2 && apt clean all && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd

EXPOSE 80
EXPOSE 443

COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]

