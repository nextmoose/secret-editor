#!/bin/sh

mkdir /home/user/.ssh &&
    chmod 0700 /home/user/.ssh &&
    touch /home/user/.ssh/origin_id_rsa &&
    cp /opt/docker/extension/config /home/user/.ssh/config &&
    chmod 0600 /home/user/.ssh/origin_id_rsa /home/user/.ssh/config