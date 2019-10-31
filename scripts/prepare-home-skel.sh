#!/bin/sh
# aus config/includes.chroot/etc/skel wird späteres /home/live/ Verzeichnis

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

mkdir -pv config/includes.chroot/etc/skel
for link in variants/${BUILD_VARIANT}/inherit/*; do
  rsync --verbose --archive --stats --info=progress2 ${link}/user-config/ config/includes.chroot/etc/skel/
done
rsync --verbose --archive --stats --info=progress2 --checksum variants/${BUILD_VARIANT}/user-config/ config/includes.chroot/etc/skel/
scripts/copy-docs.sh
ln -sv  /usr/local/share/doc/FSFW-Dresden config/includes.chroot/etc/skel/FSFW-Material

echo "schreibe git-versionsnummer & URL in HOME/.version_fsfw-uni-stick"

echo "FSFW_UNI_STICK_VERSION = $(scripts/calc-version-number.sh)" > config/includes.chroot/etc/skel/.version_fsfw-uni-stick
echo "git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/etc/skel/.version_fsfw-uni-stick

echo "${0} beendet"
