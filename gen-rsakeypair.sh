#!/bin/bash

openssl genrsa -aes256 -out ~/rsaprivatekey.pem 4096

openssl rsa -in rsaprivatekey.pem -inform PEM -pubout -outform PEM -out ~/rsapublickey.pem
