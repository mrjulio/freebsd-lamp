#!/usr/bin/env bash

#
# CI-Tools
#

if [ $(pkg_info | grep -c ^pear-) -eq 0 ]
then
    echoStatus $COLOR_BLUE '[INSTALL] ci'

    cd /usr/ports/devel/pear
    make install clean

    pear channel-discover pear.phing.info
    pear install phing/phing

    pear config-set auto_discover 1
    pear install pear.phpunit.de/phpcpd

    pear install PHP_CodeSniffer

    pear channel-discover bartlett.laurent-laville.org
    pear install bartlett/PHP_CompatInfo

    pear channel-discover pear.pdepend.org
    pear install pdepend/PHP_Depend-beta

    pear channel-discover pear.phpdoc.org
    pear install phpdoc/phpDocumentor-alpha

    pear install pear.phpunit.de/phploc

    pear channel-discover pear.phpmd.org
    pear install --alldeps phpmd/PHP_PMD

    pear install pear.phpunit.de/PHPUnit

    pear install phpunit/phpdcd-0.9.3

    echoStatus $COLOR_GREEN '[FINISH] ci'
else
    echoStatus $COLOR_WHITE '[SKIP] ci'
fi
