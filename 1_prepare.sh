#!/bin/sh

# ports
portsnap fetch
portsnap extract

# src
fetch ftp://ftp.freebsd.org/pub/FreeBSD/releases/`uname -m`/9.1-RELEASE/src.txz
tar -C / -xvzf src.txz
rm src.txz

# bash ~ 30minutes on 1CPU @ 2.2GHz
cd /usr/ports/shells/bash
make -DBATCH install clean
chsh -s /usr/local/bin/bash
