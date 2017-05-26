#!/usr/bin/env bash

docker build -t anmolnagpal/nodejs-base-ubuntu:7.10.0 .

if [[ $? != 0 ]]; then
    echo "nodejs-base-ubuntu Build failed."
    exit 1
fi

docker push anmolnagpal/nodejs-base-ubuntu:7.10.0
