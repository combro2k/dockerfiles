#!/usr/bin/env sh

s6-svc -t /var/run/s6/services/50_haproxy/

exit 0
