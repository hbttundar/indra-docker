#!/bin/bash
set -e
echo '-----------------------------------------------------------------------------------'
echo '--------------------- config usermod for apache -----------------------------------'
echo '-----------------------------------------------------------------------------------'
# shellcheck disable=SC1035
if [ ! -z "$WWWUSER" ]; then
  usermod -u $WWWUSER sail
fi
if [ ! -d /.composer ]; then
  mkdir /.composer
fi

chmod -R ugo+rw /.composer

if [ $# -gt 0 ]; then
  exec gosu $WWWUSER "$@"
else
  /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi
echo '-----------------------------------------------------------------------------------'
echo '----------------------- config apache modules -------------------------------------'
echo '-----------------------------------------------------------------------------------'
a2enmod rewrite
a2enmod headers
a2enmod expires
a2enmod ssl
a2enmod proxy_fcgi setenvif
a2enmod php8.0
/usr/sbin/apache2 -D FOREGROUND
