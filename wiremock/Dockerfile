FROM jecklgamis/openjdk-8-jre
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl
RUN apt clean all

ENV WIREMOCK_VERSION 2.27.2
ENV WIREMOCK_HOME /usr/local/wiremock

RUN mkdir -p ${WIREMOCK_HOME}
RUN cd /usr/local/wiremock && \
    curl -H 'Cache-Control: no-cache'  -fsLO  https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/${WIREMOCK_VERSION}/wiremock-standalone-${WIREMOCK_VERSION}.jar

RUN mkdir -p ${WIREMOCK_HOME}/__files
RUN mkdir -p ${WIREMOCK_HOME}/mappings

COPY __files/ ${WIREMOCK_HOME}/__files/
COPY mappings/ ${WIREMOCK_HOME}/mappings/

COPY run-wiremock.sh /usr/local/bin

WORKDIR /usr/local/wiremock
CMD ["/usr/local/bin/run-wiremock.sh"]

