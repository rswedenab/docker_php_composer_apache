#!/bin/bash

if [ -e /custom/start.sh ]; then
  /custom/start.sh
else
  /usr/sbin/apache2ctl -D FOREGROUND
fi
