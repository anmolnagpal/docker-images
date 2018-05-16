#!/usr/bin/env bash

<<<<<<< HEAD
docker build -t gentitope/devops-ci:0.0.1 .
=======
docker build -t anmolnagpal/devops-ci:0.0.1 .
>>>>>>> bf88c8d4b1b65ba71b5d9227ee509d6121835bad

if [[ $? != 0 ]]; then
    echo "DevOps CI Build failed."
    exit 1
fi

<<<<<<< HEAD
docker push gentitope/devops-ci:0.0.1
=======
docker push anmolnagpal/devops-ci:0.0.1
>>>>>>> bf88c8d4b1b65ba71b5d9227ee509d6121835bad
