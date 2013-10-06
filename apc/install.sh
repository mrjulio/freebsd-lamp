#!/usr/bin/env bash

#
# APC
#
# @TODO APC mem size

if [ $(pkg_info | grep -c pecl-APC) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] APC'

    cd /usr/ports/www/pecl-APC
    make -DBATCH install clean
    echo "
[apc]
apc.shm_size = 128M" >> /usr/local/etc/php.ini
    cp /usr/local/share/doc/APC/apc.php /storage/www/server/apc.php
    /usr/local/etc/rc.d/php-fpm restart
    sed -i "" "s/'USE_AUTHENTICATION',1/'USE_AUTHENTICATION',0/g" /storage/www/server/apc.php

    echoStatus $COLOR_GREEN '[FINISH] APC'
else
    echoStatus $COLOR_WHITE '[SKIP] APC'
fi
