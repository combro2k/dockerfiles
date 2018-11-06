#!/usr/bin/env sh

echo "=== SpamAssassin: Learning from SPAM ==="
find /var/vmail/ -type d -iname '.Spam' -exec /usr/local/bin/sa-learn --no-sync --spam {} \;
echo ""

echo "=== SpamAssassin: Learning from HAM ==="
find /var/vmail/ -type d -iname '.Ham' -exec /usr/local/bin/sa-learn --no-sync --ham {} \;
echo ""

echo "=== SpamAssassin: Sync Bayesian"
/usr/local/bin/sa-learn --sync

echo "=== SpamAssassin: Bayesian Statistics"
/usr/local/bin/sa-learn --dump magic
