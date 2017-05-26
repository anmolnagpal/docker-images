#!/usr/bin/env bash

docker build -t anmolnagpal/rsyslog:8.26.0 .

if [[ $? != 0 ]]; then
    echo "rsyslog Build failed."
    exit 1
fi

docker push anmolnagpal/rsyslog:8.26.0
