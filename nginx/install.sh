#!/usr/bin/env bash

#
# nginX
#

if [ $(pkg_info | grep -c nginx) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] nginx'

    cd /usr/ports/www/nginx
    make -DBATCH -DWITH_IPV6 -DWITH_HTTP -DWITH_HTTP_CACHE -DWITH_HTTP_GEOIP -DWITH_HTTP_REWRITE -DWITH_HTTP_SSL -DWITH_HTTP_STATUS -DWITH_WWW -DWITH_HTTP_AUTH_DIGEST -DWITH_HTTP_UPLOAD_PROGRESS install clean
    echo 'nginx_enable="YES"' >> /etc/rc.conf

    sed -i "" 's/#user  nobody/user  www www/g' /usr/local/etc/nginx/nginx.conf
    sed -i "" 's/worker_processes  1/worker_processes  '$SERVER_CPUS'/g' /usr/local/etc/nginx/nginx.conf

    mkdir /usr/local/etc/nginx/servers
    cd $SCRIPT_PATH
    cp nginx/public.conf /usr/local/etc/nginx/servers/
    sed -i "" 's/domain.com/'$DOMAIN'/g' /usr/local/etc/nginx/servers/public.conf
    sed -i "" 's|#gzip  on;|gzip  on;\
    include servers/\*\.conf\;\
    server_tokens off;|g' /usr/local/etc/nginx/nginx.conf

    /usr/local/etc/rc.d/nginx restart

    # HTTP Auth

    echoStatus $COLOR_BLUE '[INSTALL] HTTP auth'

    cd $SCRIPT_PATH/nginx
    chmod +x htpasswd
    echo $HTTP_AUTH_USER':'$(./htpasswd $HTTP_AUTH_PASS) > /usr/local/etc/nginx/passwd
    cp $SCRIPT_PATH/nginx/server.conf /usr/local/etc/nginx/servers/
    sed -i "" 's/domain.com/'$DOMAIN'/g' /usr/local/etc/nginx/servers/server.conf

    echoStatus $COLOR_GREEN '[FINISH] HTTP auth + nginx'
else
    echoStatus $COLOR_WHITE '[SKIP] nginx'
fi
