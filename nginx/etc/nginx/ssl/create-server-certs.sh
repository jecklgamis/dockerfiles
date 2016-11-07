#!/usr/bin/env bash
set -ex
echo "Creating self signed server certificate"
SUBJECT="/C=AU/ST=NSW/L=Sydney/O=www.example.com/OU=Engineering/CN=api.example.com"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj ${SUBJECT}
