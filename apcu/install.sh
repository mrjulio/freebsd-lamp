#!/usr/bin/env bash

#
# APCu
#
# @TODO APCu mem size

if [ $(pkg_info | grep -c pecl-APCu) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] APCu'

    cd /usr/ports/devel/pecl-APCu
    make -DBATCH install clean
    echo "
[apc]
apc.shm_size = 128M" >> /usr/local/etc/php.ini
    fetch --no-verify-peer -o /storage/www/server/apc.php https://raw.github.com/krakjoe/apcu/simplify/apc.php
    sed -i "" "s/'USE_AUTHENTICATION',1/'USE_AUTHENTICATION',0/g" /storage/www/server/apc.php
    
    /usr/local/etc/rc.d/php-fpm restart

    echoStatus $COLOR_GREEN '[FINISH] APCu'
else
    echoStatus $COLOR_WHITE '[SKIP] APCu'
fi
