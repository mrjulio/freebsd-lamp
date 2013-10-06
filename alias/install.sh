#!/usr/bin/env bash

#
# alias
#

if [ ! -f '/home/'$BSD_USER'/.bash_profile' ]
then
    echoStatus $COLOR_BLUE '[INSTALL] aliases'

    cp $SCRIPT_PATH/alias/aliases /home/$BSD_USER/.bash_profile
    chown $BSD_USER /home/$BSD_USER/.bash_profile

    echoStatus $COLOR_GREEN '[FINISH] aliases'
else
    echoStatus $COLOR_WHITE '[SKIP] aliases'
fi
