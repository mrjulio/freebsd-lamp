#!/usr/bin/env bash

#
# GIT
#

# @TODO gitweb


if [ $(pkg_info | grep -c ^git-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] Git'

    cd /usr/ports/devel/git
    make -DBATCH -DWITH_GITWEB -DWITHOUT_P4 -DWITHOUT_CVS install clean
    cp $SCRIPT_PATH/git/.gitconfig /home/$BSD_USER/.gitconfig
    chown $BSD_USER /home/$BSD_USER/.gitconfig
    sed -i "" 's/<user-name>/'$GIT_USER'/g' /home/$BSD_USER/.gitconfig
    sed -i "" 's/<user-email>/'$GIT_EMAIL'/g' /home/$BSD_USER/.gitconfig

    echoStatus $COLOR_GREEN '[FINISH] Git'
else
    echoStatus $COLOR_WHITE '[SKIP] Git'
fi
