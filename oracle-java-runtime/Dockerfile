FROM ubuntu:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get -y update && apt-get -y install wget
RUN cd /usr/local/ \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jre-8u112-linux-x64.tar.gz \
    && tar xvf jre-8u112-linux-x64.tar.gz && ln -s /usr/local/jre1.8.0_112 /usr/local/java

ENV JAVA_HOME /usr/local/java
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]