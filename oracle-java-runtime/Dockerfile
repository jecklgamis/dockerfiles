FROM ubuntu:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get -y update && apt-get -y install wget
RUN cd /usr/local/ \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jre-8u181-linux-x64.tar.gz \
    && tar xvf jre-8u181-linux-x64.tar.gz && ln -s /usr/local/jre1.8.0_181 /usr/local/java

ENV JAVA_HOME /usr/local/java
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]