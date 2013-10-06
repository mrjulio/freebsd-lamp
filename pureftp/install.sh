#!/usr/bin/env bash

#
# PureFTPd
#

if [ $(pkg_info | grep -c ^pure-ftpd-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] pure-ftpd'

    cd /usr/ports/ftp/pure-ftpd
    make -DBATCH -DWITH_MYSQL -DWITH_LARGEFILE -DWITH_UTF8 install clean
    echo 'pureftpd_enable="YES"' >> /etc/rc.conf
    cp /usr/local/etc/pure-ftpd.conf.sample  /usr/local/etc/pure-ftpd.conf

    cp $SCRIPT_PATH/pureftp/pureftpd-mysql.conf > /usr/local/etc/pureftpd-mysql.conf

    sed -i "" 's/# MySQLConfigFile/MySQLConfigFile/g' /usr/local/etc/pure-ftpd.conf
    sed -i "" 's_/etc/pureftpd-mysql.conf_/usr/local/etc/pureftpd-mysql.conf_g' /usr/local/etc/pure-ftpd.conf
    sed -i "" 's/133:022/003:003/g' /usr/local/etc/pure-ftpd.conf

    mysql -u root -e "CREATE DATABASE pureftpd"
    mysql -u root pureftpd < pureftp/import.sql

    adduser -f $SCRIPT_PATH/pureftp/user

    echoStatus $COLOR_GREEN '[FINISH] pure-ftpd'
else
    echoStatus $COLOR_WHITE '[SKIP] pure-ftpd'
fi
