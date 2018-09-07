#!/bin/sh
# aus config/includes.chroot/etc/skel wird späteres /home/live/ Verzeichnis

. "`dirname "${0}"`/functions.sh"
cd_repo_root

FSFW_UNI_STICK_CONFIG=$1
echo "FSFW-Uni-Stick ${0} ${FSFW_UNI_STICK_CONFIG} " 

# === FIXME KILL => auto/clean
# aufräumen ( ist ../home/user vorhanden wird die config nicht aus ../etc/skel übernommen)
  if [ -d config/includes.chroot/home/ ]; then
         echo "etwas ist sehr fail"
         read -n1
	 rm -Ri config/includes.chroot/home
	 echo " config/includes.chroot/home gelöscht"
  fi 
# === FIXME KILL => auto/clean

mkdir -pv config/includes.chroot/etc/skel
rsync --verbose --archive --copy-links --stats --info=progress2 variants/${FSFW_UNI_STICK_CONFIG}/home_skel/ config/includes.chroot/etc/skel 

echo "schreibe git-versionsnummer & URL in HOME/.version_fsfw-uni-stick"

echo "FSFW_UNI_STICK_VERSION = $(scripts/calc-version-number.sh)" > config/includes.chroot/etc/skel/.version_fsfw-uni-stick
echo "git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/etc/skel/.version_fsfw-uni-stick

echo "fsfw-uni-stick_user_config.sh  beendet"
