#!/bin/bash

if [ -e /custom_config/custom_start.sh ]; then
  /custom_config/custom_start.sh
else
  /usr/sbin/apache2ctl -D FOREGROUND
fi
