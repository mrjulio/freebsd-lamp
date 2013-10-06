#!/usr/bin/env bash

if [ -f '/storage/www/server/adminer.php' ]
then
    echoStatus $COLOR_WHITE '[SKIP] adminer'
else
    # test
    echoStatus $COLOR_BLUE '[INSTALL] adminer'

    cd /storage/www/server
    fetch 'http://downloads.sourceforge.net/adminer/adminer-'$ADMINER_VERSION'-en.php'
    mv 'adminer-'$ADMINER_VERSION'-en.php' adminer.php

    echoStatus $COLOR_GREEN '[FINISH] adminer'
fi
