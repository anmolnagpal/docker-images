#!/usr/bin/env bash

docker build -t anmolnagpal/ops-machine:1.8.2 .

if [[ $? != 0 ]]; then
    echo "DevOps Build failed."
    exit 1
fi

docker push anmolnagpal/ops-machine:1.8.2
