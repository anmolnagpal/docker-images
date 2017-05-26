#!/usr/bin/env bash

docker build -t anmolnagpal/php-base-alpine:7.1.5 .

if [[ $? != 0 ]]; then
    echo "php-base-alpine Build failed."
    exit 1
fi

docker push anmolnagpal/php-base-alpine:7.1.5
