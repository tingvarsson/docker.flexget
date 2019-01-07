#!/bin/sh
if [ -f /flexget/.config-lock ]; then
    rm /flexget/.config-lock
fi
flexget -c /flexget/config.yml daemon start
