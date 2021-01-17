FROM jecklgamis/beats:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y supervisor curl nodejs

COPY http-server.js /usr/local/app/bin/
COPY app-supervisor.conf /etc/supervisor/conf.d/
COPY filebeat.yml /usr/local/filebeat/

RUN chmod +x /usr/local/app/bin/http-server.js
RUN mkdir -p /var/log/app/

ENV APP_NAME app
ENV APP_LOG_PATH /var/log/app/*.log

CMD /usr/bin/supervisord
