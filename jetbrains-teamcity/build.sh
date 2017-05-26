#!/usr/bin/env bash

docker build -t anmolnagpal/teamcity:2017.1.1-alpine .

if [[ $? != 0 ]]; then
    echo "teamcity Build failed."
    exit 1
fi

docker push anmolnagpal/teamcity:2017.1.1-alpine
