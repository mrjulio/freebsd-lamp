#!/usr/bin/env bash

#
# MySQL
#

# MySQL 1h on 1 core @ 2GHz / 50min on 2 cores @ 2GHz


if [ $(pkg_info | grep -c mysql-server) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] MySQL'

    cd "/usr/ports/databases/$MYSQL_PORT"
    make -DBATCH install clean
    echo 'mysql_enable="YES"' >> /etc/rc.conf
    /usr/local/etc/rc.d/mysql-server onestart
    cd /usr/local
    mysql_install_db

    sed -i "" 's:\[mysqld\]:\[mysqld\]\
innodb_file_per_table\
character-set-server=utf8\
collation-server=utf8_general_ci\
skip-character-set-client-handshake\
bind-address=127.0.0.1:g' /usr/local/my.cnf

    /usr/local/etc/rc.d/mysql-server restart

    echoStatus $COLOR_GREEN '[FINISH] MySQL'
else
    echoStatus $COLOR_WHITE '[SKIP] MySQL'
fi

# @TODO
#cd /usr/local
#./bin/mysql_secure_installation
