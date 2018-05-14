#!/usr/bin/env bash

docker build -t anmolnagpal/docker-ci:0.0.1 .

if [[ $? != 0 ]]; then
    echo "DevOps CI Build failed."
    exit 1
fi

docker push anmolnagpal/docker-ci:0.0.1
