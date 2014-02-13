#!/usr/bin/env bash

. config.sh

echo -en "\n$(date): Start *NEW* installation\n" >> install_log

#. tweaks/install.sh
#. storage/install.sh
#. adminer/install.sh
#. mysql/install.sh
#. nginx/install.sh
#. php/install.sh
#. apc/install.sh #deprecated in php55
#. apcu/install.sh
#. ntp/install.sh
#. rsync/install.sh
#. sudo/install.sh
#. ci/install.sh
#. git/install.sh
#. mc/install.sh
#. ssh/install.sh
#. nano/install.sh
#. lsof/install.sh
#. adduser/install.sh
#. alias/install.sh
#. pureftp/install.sh
#. zabbix/install.sh
#. samba/install.sh
#. phalcon/install.sh
#. xdebug/install.sh
#. htop/install.sh -- Fails w/o linux support
