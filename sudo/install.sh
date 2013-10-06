#!/usr/bin/env bash

#
# SUDO
#

if [ $(pkg_info | grep -c ^sudo-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] sudo'

    cd /usr/ports/security/sudo
    make -DBATCH install clean
    sed -i "" 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /usr/local/etc/sudoers

    echoStatus $COLOR_GREEN '[FINISH] sudo'
else
    echoStatus $COLOR_WHITE '[SKIP] sudo'
fi