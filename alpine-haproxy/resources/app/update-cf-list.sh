#!/usr/bin/env bash

curl --silent --output /data/cf-list-v4.txt https://www.cloudflare.com/ips-v4
curl --silent --output /data/cf-list-v6.txt https://www.cloudflare.com/ips-v6
