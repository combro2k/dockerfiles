#!/usr/bin/env sh

while ! test -f /tmp/haproxy.pid; do
  echo "Waiting 1 second haproxy to start up ..."
  sleep 1
done

if ! /usr/sbin/haproxy -c -f /etc/haproxy/haproxy.cfg -f /data/haproxy.d/; then
  echo "Not reloading haproxy because there are errors"

  exit 1
fi

echo "Reloading haproxy"
/command/s6-svc -t /var/run/s6/legacy-services/50_haproxy/

exit 0
