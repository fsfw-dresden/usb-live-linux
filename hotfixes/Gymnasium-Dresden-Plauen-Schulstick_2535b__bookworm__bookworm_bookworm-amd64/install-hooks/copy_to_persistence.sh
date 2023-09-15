#!/bin/sh

PERSISTENCESTORE=$(mktemp --tmpdir --directory hotfix.XXXX)
mount -v ${1}3 ${PERSISTENCESTORE}
cp -av install-data/* ${PERSISTENCESTORE}/
umount -v ${PERSISTENCESTORE}
rmdir ${PERSISTENCESTORE}
