#!/bin/bash

if [ -e /etc/apache2/custom_start.sh ]
  /etc/apache2/custom_start.sh
else
  /usr/sbin/apache2ctl -D FOREGROUND
fi
