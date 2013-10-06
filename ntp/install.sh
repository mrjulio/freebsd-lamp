#!/usr/bin/env bash

#
# NTP
#

# @TODO CHECK http://pc-freak.net/blog/how-to-install-openntpd-ntp-server-to-synchronize-system-clock-on-freebsd-for-better-security/

if [ $(pkg_info | grep -c ^openntpd-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] OpenNTP'

    cd /usr/ports/net/openntpd
    make install clean
    echo 'openntpd_enable="YES"' >> /etc/rc.conf
    cp /usr/local/share/examples/openntpd/ntpd.conf /usr/local/etc/ntpd.conf

    echoStatus $COLOR_GREEN '[FINISH] OpenNTP'
else
    echoStatus $COLOR_WHITE '[SKIP] OpenNTP'
fi
