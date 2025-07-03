FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y apache2
RUN apt clean all
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

EXPOSE 80
EXPOSE 443

COPY run-apache2.sh /usr/local/bin
CMD ["/usr/local/bin/run-apache2.sh"]

