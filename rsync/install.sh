#!/usr/bin/env bash

#
# RSYNC
#

if [ $(pkg_info | grep -c ^rsync-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] rsync'

    cd /usr/ports/net/rsync/
    make -DBATCH install clean

    echoStatus $COLOR_GREEN '[FINISH] rsync'
else
    echoStatus $COLOR_WHITE '[SKIP] rsync'
fi