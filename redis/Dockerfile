FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y curl build-essential && apt clean all

ENV REDIS_PKG_NAME=redis-8.0.2

RUN cd /usr/local && curl -O https://download.redis.io/releases/$REDIS_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $REDIS_PKG_NAME.tar.gz && rm -f  $REDIS_PKG_NAME.tar.gz
RUN ln -s /usr/local/$REDIS_PKG_NAME /usr/local/redis
RUN cd /usr/local/redis && make

RUN groupadd -r redis && useradd -r -gredis redis
RUN chown -R redis:redis /usr/local/redis*

COPY run-redis.sh /usr/local/bin
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /usr/local/redis/redis.conf

CMD ["/usr/local/bin/run-redis.sh"]


