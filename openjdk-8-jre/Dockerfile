FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt update -y && apt install -y openjdk-8-jre-headless
RUN apt clean all

CMD ["java","-version"]