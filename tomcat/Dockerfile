FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl
RUN groupadd -r tomcat && useradd -r -gtomcat tomcat

ENV TOMCAT_VERSION 9.0.8
ENV TOMCAT_PKG_NAME apache-tomcat-$TOMCAT_VERSION

RUN cd /usr/local && curl -O http://apache.uberglobalmirror.com/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/$TOMCAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $TOMCAT_PKG_NAME.tar.gz
RUN ln -s /usr/local/$TOMCAT_PKG_NAME /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/$TOMCAT_PKG_NAME

COPY run-tomcat.sh /usr/local/bin
CMD ["/usr/local/bin/run-tomcat.sh"]

