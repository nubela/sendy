#!/bin/sh

chown :www-data /data/htdocs

/usr/bin/php-fpm5 &

mkdir -p /tmp/nginx
chown nginx /tmp/nginx

/usr/sbin/nginx
