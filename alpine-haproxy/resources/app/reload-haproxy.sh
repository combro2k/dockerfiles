#!/usr/bin/env sh

if ! haproxy -c -f /etc/haproxy/haproxy.cfg -f /etc/haproxy/haproxy.cfg -f /data/haproxy.d/; then
  echo "Not reloading haproxy because there are errors"

  exit 1
fi
s6-svc -t /var/run/s6/services/50_haproxy/

exit 0
