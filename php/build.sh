#!/usr/bin/env bash

docker build -t anmolnagpal/php:7.2.3 .

if [[ $? != 0 ]]; then
    echo "php-docker Build failed."
    exit 1
fi

docker push anmolnagpal/php:7.2.3
