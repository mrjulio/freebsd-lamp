#!/usr/bin/env bash

#
# Xdebug
#

if [ $(pkg_info | grep -c ^php-xdebug) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] Xdebug'

    cd /usr/ports/devel/php-xdebug/
    make install clean

    cat $SCRIPT_PATH/xdebug/xdebug.conf >> /usr/local/etc/php.ini

    sed -i "" 's/extension=xdebug.so/;extension=xdebug.so/g' /usr/local/etc/php/extensions.ini

    mkdir /tmp/profiler
    chmod 777 /tmp/profiler

    echoStatus $COLOR_GREEN '[FINISH] Xdebug'
else
    echoStatus $COLOR_WHITE '[SKIP] Xdebug'
fi
