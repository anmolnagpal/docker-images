#!/usr/bin/env bash

docker build -t anmolnagpal/devops-ci:0.0.2 .

if [[ $? != 0 ]]; then
    echo "DevOps CI Build failed."
    exit 1
fi

docker push anmolnagpal/devops-ci:0.0.2
