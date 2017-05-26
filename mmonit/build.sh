#!/usr/bin/env bash

docker build -t anmolnagpal/mmonit:3.7.1 .

if [[ $? != 0 ]]; then
    echo "mmonit Build failed."
    exit 1
fi

docker push anmolnagpal/mmonit:3.7.1
