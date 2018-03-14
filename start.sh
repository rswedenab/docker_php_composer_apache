if [ -e custom_start.sh ]
  ./custom_start.sh
fi

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
