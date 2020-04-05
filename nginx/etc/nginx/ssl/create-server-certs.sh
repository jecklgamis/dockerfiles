#!/usr/bin/env bash
set -ex
echo "Creating self signed server certificate"
SUBJECT="/C=AU/ST=NSW/L=Sydney/O=nginx.jecklgamis.com/OU=Engineering/CN=nginx.jecklgamis.com"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj ${SUBJECT}
