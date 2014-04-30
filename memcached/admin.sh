#!/usr/bin/env bash

#
# Install Memcached Admin
#
# https://code.google.com/p/phpmemcacheadmin/
#

cd /storage/www/server
fetch http://phpmemcacheadmin.googlecode.com/files/phpMemcachedAdmin-1.2.2-r262.zip
unzip phpMemcachedAdmin-1.2.2-r262.zip -d memcached
rm phpMemcachedAdmin-1.2.2-r262.zip
