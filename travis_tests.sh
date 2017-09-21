#!/usr/bin/env bash

set -e

BASE=$(readlink -f $(dirname $0))

cd ${BASE}

# Build base container
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-base:latest alpine-base

# Build dependendable containers
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-php5:latest alpine-nginx-php5
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nginx-php7:latest alpine-nginx-php7
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-nodejs:latest alpine-nodejs

# Standalone containers
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-posty-api:latest alpine-posty-api
docker rmi combro2k/alpine-posty-api:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-posty-webui:latest alpine-posty-webui
docker rmi combro2k/alpine-posty-webui:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-netdata:latest alpine-netdata
docker rmi combro2k/alpine-netdata:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-haproxy:latest alpine-haproxy
docker rmi combro2k/alpine-haproxy:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-teamspeak3:latest alpine-teamspeak3
docker rmi combro2k/alpine-teamspeak3:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-prosody:latest alpine-prosody
docker rmi combro2k/alpine-prosody:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-openfire:latest alpine-openfire
docker rmi combro2k/alpine-openfire:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-softether:latest alpine-softether
docker rmi combro2k/alpine-softether:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-aptly:latest alpine-aptly
docker rmi combro2k/alpine-aptly:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-virtualmail:latest alpine-virtualmail
docker rmi combro2k/alpine-virtualmail:latest
docker build --pull --no-cache --rm --force-rm=true --tag combro2k/alpine-djigzo:latest alpine-djigzo
docker rmi combro2k/alpine-djigzo:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-fluentd:latest alpine-fluentd
docker rmi combro2k/alpine-fluentd:latest
docker build --no-cache --rm --force-rm=true --tag combro2k/alpine-spiderfoott:latest alpine-spiderfoot
docker rmi combro2k/alpine-spiderfoot:latest

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
docker rmi combro2k/alpine-nodejs:latest
docker rmi combro2k/alpine-nginx-php5:latest
docker rmi combro2k/alpine-nginx-php7:latest
docker rmi combro2k/alpine-base:latest
