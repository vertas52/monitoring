#!/bin/bash

set -xe

export HOSTNAME=$(hostname -f)
docker-compose down
git stash
git pull --rebase
git stash pop
docker-compose up -d
