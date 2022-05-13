#!/usr/bin/env bash

set -eux

cd /opt/c9sdk
/opt/node-v12.18.4-linux-x64/bin/node server.js \
    --listen 0.0.0.0 \
    --port 80 \
    -w /workspace \
    --auth "${USERNAME}:${PASSWORD}"