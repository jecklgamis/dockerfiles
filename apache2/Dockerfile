FROM ubuntu:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
COPY apache2-supervisor.conf /etc/supervisor/conf.d

EXPOSE 80
EXPOSE 443

COPY run-apache2.sh /usr/local/bin
CMD ["/usr/bin/supervisord"]

