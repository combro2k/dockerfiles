#!/usr/bin/env sh

find /var/vmail/ -type d -iname '.Spam' -exec /usr/local/bin/sa-learn --no-sync --spam {} \;
find /var/vmail/ -type d -iname '.Ham' -exec /usr/local/bin/sa-learn --no-sync --ham {} \;

/usr/local/bin/sa-learn --sync
/usr/local/bin/sa-learn --dump magic
