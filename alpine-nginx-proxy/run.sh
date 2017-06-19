#!/bin/bash

docker run -ti --rm --name alpine-nginx-proxy -p 80:80 -p 443:443 -v /var/run/docker.sock:/tmp/docker.sock:ro combro2k/alpine-nginx-proxy:latest ${@}
