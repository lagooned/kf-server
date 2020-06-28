#!/bin/bash

set -x

SERVER_NAME=$1
GAME_PASS=$2

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

podman run \
    --userns keep-id\
    -e KF_SERVER_NAME="${SERVER_NAME}"\
    -e KF_GAMEPASS="${GAME_PASS}" \
    -v $CURRENT_DIR/kf:/kf \
    -p 7707:7707/udp \
    -p 7708:7708/udp \
    -p 7717:7717/udp \
    -p 8075:8075/tcp \
    -p 20650:20650/udp \
    -p 28852:28852 \
    -it lagooned/kf-server:latest

set +x
