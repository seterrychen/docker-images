#!/usr/bin/env bash

set -xe

echo "Clean up"

apt clean all
apt autoremove
rm -rf /var/lib/apt/lists
cat $KATALON_VERSION_FILE
