#!/bin/bash

/usr/local/apache2/bin/apachectl restart
for I in {10..1};
do
echo "${I} seconds until owncloud online"
sleep 1
done

tail -f /usr/local/apache2/logs/error_log
