#!/usr/bin/env bash

docker build -t anmolnagpal/grafana:4.3.1 .

if [[ $? != 0 ]]; then
    echo "mmonit Build failed."
    exit 1
fi

docker push anmolnagpal/grafana:4.3.1
