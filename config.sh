#!/usr/bin/env bash

# LINKS
# https://www.random.org/passwords/?num=1&len=24&format=plain&rnd=new

#
# Deploy constants
#

BOOT_DELAY=3

DOMAIN='dev.ro'
BSD_USER='julio'
MYSQL_PORT='mysql56-server'
SERVER_CPUS=2

PHP_INI='production'
PHP_TIMEZONE='Europe/Bucharest'
PHP_EXT=(CTYPE CURL DOM EXIF FILEINFO FILTER GD GETTEXT HASH ICONV JSON MBSTRING MCRYPT MYSQLI PCNTL PDF PDO PDO_SQLITE PHAR POSIX SESSION SIMPLEXML SQLITE3 TIDY TOKENIZER XML XMLREADER XMLWRITER XSL ZIP ZLIB)

HTTP_AUTH_USER='administrator'
HTTP_AUTH_PASS='VJtfntnqeCFaecCLXKc7PY2K'

SSH_PORT='22022'

SCRIPT_PATH=$(pwd)

ADMINER_VERSION='3.7.1'

GIT_USER='julio'
GIT_EMAIL='julio@gmail.com'

SAMBA_PASS='windows-pass-for-no-prompt'

#
# Helpers
#

COLOR_WHITE="\033[0;7m"
COLOR_RED="\033[0;30;41m"
COLOR_BLUE="\033[0;44m"
COLOR_GREEN="\033[0;30;42m"
COLOR_RESET="\033[0;37m"

echoStatus()
{
    cd $SCRIPT_PATH
    echo ""
    echo -en "\n$1 $2 $COLOR_RESET\n\n"
    echo $(date)': '$2 >> install_log
    sleep 2
}
