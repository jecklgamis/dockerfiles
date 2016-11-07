FROM jecklgamis/java-runtime:latest
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y wget supervisor
RUN groupadd -r tomcat && useradd -r -gtomcat tomcat

ENV TOMCAT9_VERSION 9.0.0.M11
ENV TOMCAT9_PKG_NAME apache-tomcat-$TOMCAT9_VERSION

RUN cd /usr/local && wget http://apache.uberglobalmirror.com/tomcat/tomcat-9/v$TOMCAT9_VERSION/bin/$TOMCAT9_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $TOMCAT9_PKG_NAME.tar.gz
RUN ln -s /usr/local/$TOMCAT9_PKG_NAME /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/$TOMCAT9_PKG_NAME

COPY run-tomcat.sh /usr/local/bin
COPY tomcat-supervisor.conf /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]

