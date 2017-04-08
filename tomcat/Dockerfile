FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y wget supervisor
RUN groupadd -r tomcat && useradd -r -gtomcat tomcat

ENV TOMCAT8_VERSION 8.5.13
ENV TOMCAT8_PKG_NAME apache-tomcat-$TOMCAT8_VERSION

RUN cd /usr/local && wget http://apache.uberglobalmirror.com/tomcat/tomcat-8/v$TOMCAT8_VERSION/bin/$TOMCAT8_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $TOMCAT8_PKG_NAME.tar.gz
RUN ln -s /usr/local/$TOMCAT8_PKG_NAME /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/$TOMCAT8_PKG_NAME

COPY run-tomcat.sh /usr/local/bin
COPY tomcat-supervisor.conf /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]

