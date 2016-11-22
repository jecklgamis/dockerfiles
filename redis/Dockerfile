FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y supervisor wget build-essential

ENV REDIS_PKG_NAME redis-3.2.5

RUN cd /usr/local && wget http://download.redis.io/releases/$REDIS_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $REDIS_PKG_NAME.tar.gz && rm -f  $REDIS_PKG_NAME.tar.gz
RUN ln -s /usr/local/$REDIS_PKG_NAME /usr/local/redis
RUN cd /usr/local/redis && make

RUN groupadd -r redis && useradd -r -gredis redis
RUN chown -R redis:redis /usr/local/redis*

RUN mkdir -p /var/log/supervisor
COPY run-redis.sh /usr/local/bin
COPY redis-supervisor.conf /etc/supervisor/conf.d/
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /usr/local/redis/redis.conf

CMD ["/usr/bin/supervisord"]


