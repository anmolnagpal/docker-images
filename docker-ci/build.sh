#!/usr/bin/env bash

docker build -t gentitope/devops-ci:0.0.1 .

if [[ $? != 0 ]]; then
    echo "DevOps CI Build failed."
    exit 1
fi

docker push gentitope/devops-ci:0.0.1
