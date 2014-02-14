#!/usr/bin/env bash

#
# MC
#

if [ $(pkg info | grep -c ^mc-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] MC'

    cd /usr/ports/misc/mc
    make -DBATCH -DWITHOUT_X11 -DWITHOUT_SMB install clean

    echoStatus $COLOR_GREEN '[FINISH] MC'
else
    echoStatus $COLOR_WHITE '[SKIP] MC'
fi
