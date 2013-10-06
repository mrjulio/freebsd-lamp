#!/usr/bin/env bash

#
# nano
#

if [ $(pkg_info | grep -c ^nano-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] nano'

    cd /usr/ports/editors/nano
    make install clean
    cp $SCRIPT_PATH/nano/.nanorc /home/$BSD_USER/.nanorc
    chown $BSD_USER /home/$BSD_USER/.nanorc

    echoStatus $COLOR_GREEN '[FINISH] nano'
else
    echoStatus $COLOR_WHITE '[SKIP] nano'
fi
