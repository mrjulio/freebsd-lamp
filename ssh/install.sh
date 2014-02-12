#!/usr/bin/env bash

#
# SSH
#

if [ ! -d '/home/'$BSD_USER'/.ssh' ]
then
    echoStatus $COLOR_BLUE '[INSTALL] ssh security'

    mkdir -p /home/$BSD_USER/.ssh
    chown $BSD_USER /home/$BSD_USER/.ssh
    cp $SCRIPT_PATH/ssh/authorized_keys /home/$BSD_USER/.ssh/
    sed -i "" 's/#Port 22/Port '$SSH_PORT'/g' /etc/ssh/sshd_config
    sed -i "" 's/PermitRootLogin no/PermitRootLogin no/g' /etc/ssh/sshd_config
    sed -i "" 's/#PasswordAuthentication no/PasswordAuthentication no/g' /etc/ssh/sshd_config
    sed -i "" 's/#ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/g' /etc/ssh/sshd_config
    sed -i "" 's/#UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

    echoStatus $COLOR_GREEN '[FINISH] ssh security'
else
    echoStatus $COLOR_WHITE '[SKIP] ssh security'
fi
