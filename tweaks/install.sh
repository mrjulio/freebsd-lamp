#!/usr/bin/env bash

if [ ! -f /boot/loader.conf ]
then
    echoStatus $COLOR_BLUE '[INSTALL] Tweaks'

    echo '# Tweaks' >> /boot/loader.conf
    echo 'autoboot_delay="'$BOOT_DELAY'''"' >> /boot/loader.conf

    echoStatus $COLOR_GREEN '[FINISH] Tweaks'
else
    echoStatus $COLOR_WHITE '[SKIP] Tweaks'
fi
