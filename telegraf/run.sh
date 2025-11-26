#!/bin/bash

set -m
CONFIG_TEMPLATE="/telegraf.conf.template"
CONFIG_FILE="/etc/telegraf/telegraf.conf"

sed -e "s/\${TELEGRAF_HOST}/$TELEGRAF_HOST/" \
    $CONFIG_TEMPLATE > $CONFIG_FILE

mount --bind /hostfs/proc/ /proc/

echo "=> Starting Telegraf ..."
exec telegraf -config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf/telegraf.d
