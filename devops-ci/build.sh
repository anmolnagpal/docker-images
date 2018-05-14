#!/usr/bin/env bash

docker build -t anmolnagpal/devops-ci:0.0.1 .

if [[ $? != 0 ]]; then
    echo "devops-ci Build failed."
    exit 1
fi

docker push anmolnagpal/devops-ci:0.0.1
