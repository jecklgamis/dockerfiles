FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get -y update && apt-get -y install curl
RUN cd /usr/local/ \
    && curl -L -O --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jre-8u192-linux-x64.tar.gz \
    && tar xvf jre-8u192-linux-x64.tar.gz && ln -s /usr/local/jre1.8.0_192 /usr/local/java

ENV JAVA_HOME /usr/local/java
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]