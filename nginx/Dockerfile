FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl
COPY etc/nginx/ssl/nginx.crt /etc/nginx/ssl/
COPY etc/nginx/ssl/nginx.key /etc/nginx/ssl/

COPY etc/nginx/nginx.conf /etc/nginx
COPY run-nginx.sh /usr/local/bin/

EXPOSE 80
EXPOSE 443

CMD ["/usr/local/bin/run-nginx.sh"]

