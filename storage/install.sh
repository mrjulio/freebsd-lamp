#!/usr/bin/env bash

#
# Storage
#

if [ -d '/storage' ]
then
    echoStatus $COLOR_WHITE '[SKIP] /storage'
else
    echoStatus $COLOR_BLUE '[INSTALL] /storage'

    mkdir /storage
    mkdir /storage/www
    mkdir /storage/www/public
    mkdir /storage/www/server
    mkdir /storage/git
    mkdir /storage/ftp
    mkdir /storage/db
    mkdir /storage/conf
    chmod -R 777 /storage
    touch /storage/www/public/index.html
    echo 'Hello!' > /storage/www/public/index.html

    echoStatus $COLOR_GREEN '[FINISH] /storage'
fi
