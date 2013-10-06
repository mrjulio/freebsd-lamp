#!/usr/bin/env bash

#
# Phalcon
#

if [ $(pkg_info | grep -c ^phalcon) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] Phalcon'

    cd /usr/ports/www/phalcon
    make install clean
    /usr/local/etc/rc.d/php-fpm restart

    echoStatus $COLOR_GREEN '[FINISH] Phalcon'
else
    echoStatus $COLOR_WHITE '[SKIP] Phalcon'
fi
