FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y openjdk-21-jre-headless curl && apt clean all && rm -rf /var/lib/apt/lists/*
RUN groupadd -r tomcat && useradd -r -gtomcat tomcat

ENV TOMCAT_VERSION=11.0.9
ENV TOMCAT_PKG_NAME=apache-tomcat-$TOMCAT_VERSION

RUN cd /usr/local && curl -sLO https://dlcdn.apache.org/tomcat/tomcat-11/v$TOMCAT_VERSION/bin/$TOMCAT_PKG_NAME.tar.gz
RUN cd /usr/local && tar xvf $TOMCAT_PKG_NAME.tar.gz
RUN ln -s /usr/local/$TOMCAT_PKG_NAME /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
RUN chown -R tomcat:tomcat /usr/local/$TOMCAT_PKG_NAME

COPY run-tomcat.sh /usr/local/bin
CMD ["/usr/local/bin/run-tomcat.sh"]

