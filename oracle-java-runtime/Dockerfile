FROM ubuntu:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get -y update && apt-get -y install wget
RUN cd /usr/local/ \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jre-8u141-linux-x64.tar.gz \
    && tar xvf jre-8u141-linux-x64.tar.gz && ln -s /usr/local/jre1.8.0_141 /usr/local/java

ENV JAVA_HOME /usr/local/java
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]