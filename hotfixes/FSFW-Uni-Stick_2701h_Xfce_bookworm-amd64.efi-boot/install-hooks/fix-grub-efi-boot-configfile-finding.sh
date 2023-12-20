#!/bin/sh
# abort on error
set -e

# first partition: efi boot + exchange
DEVICE=${1}1
TARGET=$(mktemp --tmpdir --directory hotfix.exchange.XXXX)
mount -v ${DEVICE} ${TARGET} && trap "umount -v ${TARGET}; rmdir ${TARGET}" 0 1 2 3 6 15

DEB_DIR=${TARGET}/EFI/debian

[ -d ${DEB_DIR} ] && echo "live-stick already fixed or without problem" && exit 0

# create the directory prefix is set to by default
mkdir -pv ${DEB_DIR}

# and copy the stub grub.cfg that points to the actual config
cp -v --preserve=timestamps ${TARGET}/EFI/grub/grub.cfg ${DEB_DIR}
