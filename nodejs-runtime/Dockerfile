FROM ubuntu:22.04

RUN apt -y update && apt -y install nodejs && apt clean all && rm -rf /var/lib/apt/lists/*

CMD ["nodejs","--version"]