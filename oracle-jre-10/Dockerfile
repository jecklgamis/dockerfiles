FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get -y update && apt-get -y install wget
RUN cd /usr/local/ \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jre-10.0.1_linux-x64_bin.tar.gz \
    && tar xvf jre-10.0.1_linux-x64_bin.tar.gz \
    && ln -s /usr/local/jre-10.0.1 /usr/local/java

ENV JAVA_HOME /usr/local/java
ENV PATH ${JAVA_HOME}/bin:${PATH}

CMD ["java","-version"]