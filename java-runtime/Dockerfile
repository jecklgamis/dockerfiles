FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt -y update && apt -y install openjdk-8-jre-headless
RUN apt clean all

CMD ["java","-version"]