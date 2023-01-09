FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt -y update && apt -y install openjdk-8-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

CMD ["java","-version"]