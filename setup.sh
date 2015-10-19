#!/bin/bash

function wait_for_mount {
    local mnt="$1"

    while ! grep $mnt /proc/mounts >/dev/null; do
        printf "\n\n====== Waiting for mount: $mnt ======\n\n"
        sleep 30s
    done
}

wait_for_mount /data/rubygems
cd /root/.gem/mirror
RUBYGEMS_PROXY=true /usr/local/bin/rackup --host 0.0.0.0 --port 80


