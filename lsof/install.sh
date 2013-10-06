#!/usr/bin/env bash

#
# install lsof
#
# needs src to be installed

if [ $(pkg_info | grep -c ^lsof-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] lsof'

    cd /usr/ports/sysutils/lsof/
    make install clean

    echoStatus $COLOR_GREEN '[FINISH] lsof'
else
    echoStatus $COLOR_WHITE '[SKIP] lsof'
fi
