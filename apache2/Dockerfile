FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y apache2
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

EXPOSE 80
EXPOSE 443

COPY run-apache2.sh /usr/local/bin
CMD ["/usr/local/bin/run-apache2.sh"]

