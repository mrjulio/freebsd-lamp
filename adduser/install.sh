#!/usr/bin/env bash

#
# Add User
#
# http://www.freebsd.org/cgi/man.cgi?query=adduser&sektion=8

cd $SCRIPT_PATH
adduser -w yes -f adduser/users
