#!/usr/bin/env bash

#
# PHP
#

if [ $(pkg_info | grep -c ^php5-5) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] PHP'

    cd /usr/ports/lang/php55
    make -DBATCH -DWITH_FPM install clean
    echo 'php_fpm_enable="YES"' >> /etc/rc.conf
    cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini
    sed -i "" 's|;session.save_path|session.save_path|g' /usr/local/etc/php.ini
    sed -i "" 's|;date.timezone =|date.timezone = "'$PHP_TIMEZONE'"|g' /usr/local/etc/php.ini
    /usr/local/etc/rc.d/php-fpm restart


    #
    # PHP Extensions
    #
    # ~45min 2cores

    echo 'WITHOUT_X11=yes' >> /etc/make.conf

    cd /usr/ports/lang/php55-extensions/
    PHP_OPT=""
    for extension in "${PHP_EXT[@]}"
    do
      PHP_OPT=$PHP_OPT' -DWITH_'$extension
    done
    PHP_INSTALL_EXTENSIONS='make install -DBATCH '$PHP_OPT' install clean'
    $PHP_INSTALL_EXTENSIONS

    echoStatus $COLOR_GREEN '[FINISH] PHP'
else
    echoStatus $COLOR_WHITE '[SKIP] PHP'
fi
