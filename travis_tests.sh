#!/usr/bin/env bash

set -e

BASE=$(readlink -f $(dirname $0))

cd ${BASE}

#for file in */Dockerfile; do
#  DIR=$(dirname ${file})
#  IMAGE=$(basename ${DIR})
#
#  echo -en  "\e[31m${IMAGE}\e[0m: "
#  if [ -f ${DIR}/.travis_skip ]; then
#    echo "Skipping..."
#  else
#    echo "Building..."
#    docker build --pull --no-cache --rm --force-rm=true --tag combro2k/${IMAGE} ${BASE}/${DIR} || exit 1
#    docker rmi combro2k/${IMAGE} || exit 1
#  fi
#  echo
#done

# Standalone containers
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-posty-api:latest alpine-posty-api
docker rmi combro2k/alpine-posty-api:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-posty-webui:latest alpine-posty-webui
docker rmi combro2k/alpine-posty-webui:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-netdata:latest alpine-netdata
docker rmi combro2k/alpine-netdata:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-haproxy:latest alpine-haproxy
docker rmi combro2k/alpine-haproxy:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-teamspeak3:latest alpine-teamspeak3
docker rmi combro2k/alpine-teamspeak3:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/prosody:latest alpine-prosody
docker rmi combro2k/alpine-prosody:latest

# Build dependendable containers
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-php5:latest alpine-nginx-php5
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-php7:latest alpine-nginx-php7

# Dependend PHP5 containers
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-wordpress:latest alpine-nginx-wordpress
docker rmi combro2k/alpine-nginx-wordpress:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-freshrss:latest alpine-nginx-freshrss
docker rmi combro2k/alpine-nginx-freshrss:latest

# Dependend PHP7 containers
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-wordpress-php7:latest alpine-nginx-wordpress-php7
docker rmi combro2k/alpine-nginx-wordpress-php7:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-nextcloud:latest alpine-nginx-nextcloud
docker rmi combro2k/alpine-nginx-nextcloud:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-rainloop:latest alpine-nginx-rainloop
docker rmi combro2k/alpine-nginx-rainloop:latest

# Destroy dependenable containers
docker rmi combro2k/alpine-nginx-php5:latest
docker rmi combro2k/alpine-nginx-php7:latest
