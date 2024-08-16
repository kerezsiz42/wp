#!/bin/sh

openssl req -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 365 \
    -nodes \
    -out fullchain.pem \
    -keyout privkey.pem \
    -subj "/C=SI/ST=Budapest/L=Budapest/O=Security/OU=IT Department/CN=localhost"