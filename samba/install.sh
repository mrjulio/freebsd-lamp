#!/usr/bin/env bash

#
# Samba
#

if [ $(pkg_info | grep -c ^samba) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] samba'

    cd /usr/ports/net/samba36
    make -DBATCH -DWITHOUT_CUPS -DWITHOUT_LDAP install clean

     cat $SCRIPT_PATH/samba/smb.conf >> /usr/local/etc/smb.conf
     sed -i "" 's/<bsd-user>/'$BSD_USER'/g' /usr/local/etc/smb.conf
     echo 'samba_enable="YES"' >> /etc/rc.conf
     echo -n -e $SAMBA_PASS"\n"$SAMBA_PASS | smbpasswd -as $BSD_USER

    echoStatus $COLOR_GREEN '[FINISH] samba'
else
    echoStatus $COLOR_WHITE '[SKIP] samba'
fi
