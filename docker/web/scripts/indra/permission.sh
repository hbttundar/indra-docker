#!/bin/bash
set -e
find /tmp/indra/ -type f -name "*.sh" -exec bash -c '
    for filename do
       chmod +x "$filename" && mv "$filename" /usr/local/bin/
    done' bash {} +
rm -rf  /tmp/indra/
#USERNAME=$(getent passwd "1000" | cut -d: -f1)
cd ~ && ls -ltra
chown -R ${WWWUSER}:www-data /var/www/html