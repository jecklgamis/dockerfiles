FROM ubuntu:18.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt-get update -y && apt-get install -y curl dumb-init
RUN apt-get update -y && apt-get install -y apt-transport-https curl lsb-core
RUN echo "deb https://kong.bintray.com/kong-deb `lsb_release -sc` main" |  tee -a /etc/apt/sources.list
RUN curl -o bintray.key https://bintray.com/user/downloadSubjectPublicKey?username=bintray
RUN apt-key add bintray.key
RUN apt-get update -y && apt-get install -y kong

COPY etc/kong/kong.conf /etc/kong
COPY etc/kong/kong.yml /etc/kong
COPY run-kong.sh /usr/local/bin/

EXPOSE 8000
EXPOSE 8001
EXPOSE 8443
EXPOSE 8444

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/run-kong.sh"]

