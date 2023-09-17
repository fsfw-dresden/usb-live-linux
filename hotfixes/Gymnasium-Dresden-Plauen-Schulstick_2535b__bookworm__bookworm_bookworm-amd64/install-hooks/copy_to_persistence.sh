#!/bin/sh
# abort on error
set -e

PERSISTENCESTORE=$(mktemp --tmpdir --directory hotfix.XXXX)
mount -v ${1}3 ${PERSISTENCESTORE} && trap "umount -v ${PERSISTENCESTORE} && rmdir ${PERSISTENCESTORE}" EXIT SIGHUP SIGQUIT SIGTERM
cp -av install-data/* ${PERSISTENCESTORE}/
