#!/usr/bin/env bash

docker build -t anmolnagpal/devops-machine:0.0.1 .

if [[ $? != 0 ]]; then
    echo "DevOps Build failed."
    exit 1
fi

docker push anmolnagpal/devops-machine:0.0.1
