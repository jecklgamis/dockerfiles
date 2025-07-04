FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

RUN apt -y update && apt -y install openjdk-21-jre-headless && apt clean all && rm -rf /var/lib/apt/lists/*

CMD ["java","-version"]