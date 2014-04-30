#!/usr/bin/env bash

#
# Memcached
#

if [ $(pkg info | grep -c memcached) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] memcached'

    cd /usr/ports/databases/memcached
    make -DBATCH install clean
    echo 'memcached_enable="YES"' >> /etc/rc.conf
    echo 'memcached_flags="-l '$MEMCACHED_LISTEN_IP' -p '$MEMCACHED_LISTEN_PORT' -m '$MEMCACHED_MEMORY' -t '$MEMCACHED_THREADS' -d"' >> /etc/rc.conf

    cd /usr/ports/databases/pecl-memcached
    make -DBATCH install clean

    echoStatus $COLOR_GREEN '[FINISH] memcached'
else
    echoStatus $COLOR_WHITE '[SKIP] memcached'
fi

