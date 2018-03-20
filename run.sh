#!/bin/bash

if [ -e /custom/start.sh ]; then
  echo "Start /custom/start.sh"
  /custom/start.sh
else
  echo "File do not exist: /custom/start.sh"
fi

/usr/sbin/apache2ctl -D FOREGROUND
