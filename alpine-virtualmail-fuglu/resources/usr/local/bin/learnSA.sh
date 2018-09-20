#!/usr/bin/env sh

find /var/vmail/ -type d \( -name '.Junk E-mail' -or -name '.Junk' \) -exec /usr/local/bin/sa-learn --no-sync --spam {} \;
find /var/vmail/ -type d \( -name '.Ham E-mail' -or -name '.Ham' \) -exec /usr/local/bin/sa-learn --no-sync --ham {} \;

/usr/local/bin/sa-learn --sync
/usr/local/bin/sa-learn --dump magic
