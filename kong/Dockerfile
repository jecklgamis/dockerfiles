FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="Jerrico Gamis <jecklgamis@gmail.com>"

ENV KONG_VERSION=3.9.3

RUN apt update -y && apt install -y curl dumb-init gnupg lsb-release ca-certificates && apt clean all
RUN curl -1sLf "https://packages.konghq.com/public/gateway-39/gpg.key" | gpg --dearmor -o /usr/share/keyrings/kong-gateway-39-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kong-gateway-39-archive-keyring.gpg] https://packages.konghq.com/public/gateway-39/deb/ubuntu $(lsb_release -cs) main" \
    | tee /etc/apt/sources.list.d/kong-gateway-39.list

RUN apt update -y && apt install -y kong=$KONG_VERSION && apt clean all && rm -rf /var/lib/apt/lists/*

COPY etc/kong/kong.conf /etc/kong/
COPY etc/kong/kong.yml /etc/kong/
COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 8000
EXPOSE 8001
EXPOSE 8443
EXPOSE 8444

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/docker-entrypoint.sh"]
