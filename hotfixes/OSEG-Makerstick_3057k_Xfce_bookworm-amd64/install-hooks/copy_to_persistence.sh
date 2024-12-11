#!/bin/bash

# abort on error
set -e

DEVICE=${1}
[[ "${DEVICE}" =~ "loop" ]] && p="p" || p=""

TARGET=$(mktemp --tmpdir --directory hotfix.persistence.XXXX)

# mount third partition: persistent memory for linux
mount -v ${DEVICE}${p}3 ${TARGET} && trap "umount -v ${TARGET} && rmdir ${TARGET} || echo ERROR" 0 1 2 3 6 15
cp -auv persistence-data/* ${TARGET}/
