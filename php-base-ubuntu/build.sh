#!/usr/bin/env bash

docker build -t anmolnagpal/php-base-ubuntu:7.1.5 .

if [[ $? != 0 ]]; then
    echo "php-base-ubuntu Build failed."
    exit 1
fi

docker push anmolnagpal/php-base-ubuntu:7.1.5
