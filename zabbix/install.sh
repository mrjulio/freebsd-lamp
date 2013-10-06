#!/usr/bin/env bash

#
# Zabbix
#
# ~45+ min

if [ $(pkg_info | grep -c ^zabbix2-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] Zabbix'

    cd /usr/ports/net-mgmt/zabbix2-server
    make -DBATCH -DWITH_SSH -DWITHOUT_LDAP install clean
    cd /usr/ports/net-mgmt/zabbix2-agent
    make -DBATCH install clean
    cd /usr/ports/net-mgmt/zabbix2-frontend
    make -DBATCH install clean
    cd /usr/local/etc/zabbix2
    cp zabbix_agent.conf.sample zabbix_agent.conf
    cp zabbix_agentd.conf.sample zabbix_agentd.conf
    cp zabbix_server.conf.sample zabbix_server.conf
    echo 'zabbix_server_enable="YES"' >> /etc/rc.conf
    echo 'zabbix_agentd_enable="YES"' >> /etc/rc.conf

    mysql -u root -e "CREATE DATABASE IF NOT EXISTS zabbix"
    mysql -u root -e "CREATE USER zabbix@localhost IDENTIFIED BY 'zabbix'"
    mysql -u root -e "GRANT ALL PRIVILEGES ON zabbix.* TO zabbix@localhost"

    cd /usr/local/share/zabbix2/server/database/mysql/
    mysql -u zabbix -pzabbix zabbix < schema.sql
    mysql -u zabbix -pzabbix zabbix < images.sql
    mysql -u zabbix -pzabbix zabbix < data.sql

    cd /usr/local/www/zabbix2
    chmod -R 774 *
    chgrp -R www *
    cp $SCRIPT_PATH/zabbix/zabbix.conf /usr/local/etc/nginx/servers/
    sed -i "" 's/domain.com/'$DOMAIN'/g' /usr/local/etc/nginx/servers/zabbix.conf

    # USE THE FUCKIN' SINGLE QUOTE!
    sed -i "" 's/apc\]/apc\]\
apc.filters = "zabbix2"/g' /usr/local/etc/php.ini

    /usr/local/etc/rc.d/nginx restart
    /usr/local/etc/rc.d/php-fpm restart
    /usr/local/etc/rc.d/zabbix_server start

    echoStatus $COLOR_GREEN '[FINISH] Zabbix'
else
    echoStatus $COLOR_WHITE '[SKIP] Zabbix'
fi
