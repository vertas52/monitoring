#!/bin/bash
set -xe
# Reloads configs without stopping prometheus
git stash
git pull --rebase
git stash pop

PROMETHEUS_PID=$(docker inspect --format '{{.State.Pid}}' prometheus)
ALERTMANAGER_PID=$(docker inspect --format '{{.State.Pid}}' alertmanager)

sudo kill -SIGHUP ${PROMETHEUS_PID}
sudo kill -SIGHUP ${ALERTMANAGER_PID}
