#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
#	VERSION: 0.0.5
#
#	CREATED: 2017-09-13
#      REVISION: 2019-07-03
#
# erstellten der user Konfiguration aus variants/${BUILD_VARIANT}/user_config/*  
# und schreibt sie nach "config/includes.chroot/etc/skel/" und "config/includes.chroot/etc/..."
#

echo "fsfw-uni-stick_user_config -  FSFW-Uni-Stick: variant PATH = ${VARIANT_PATH}  -- variant = ${BUILD_VARIANT} "
REPO_ROOT=$(git rev-parse --show-toplevel)

# aufräumen ( ist ../home/user vorhanden wird die config nicht aus ../etc/skel übernommen)
  if [ -d config/includes.chroot/home/ ]; then
	 rm -R config/includes.chroot/home
	 echo " config/includes.chroot/home gelöscht"
  fi 

 if [ ! -d config/includes.chroot/etc/skel ]; then
	 mkdir -pv config/includes.chroot/etc/skel
 fi 

# git-versionsnummer / link --> config/includes.chroot/etc/skel/.version_fsfw-uni-stick
#

echo "schreibe git-versionsnummer & URL in HOME/.version_fsfw-uni-stick"

echo "FSFW_UNI_STICK_VERSION = $(${REPO_ROOT}/tools/calc-version-number.sh) " > config/includes.chroot/etc/skel/.version_fsfw-uni-stick
echo "git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse HEAD))" >> config/includes.chroot/etc/skel/.version_fsfw-uni-stick


# ist ../variants/${BUILD_VARIANT}/user_config.sh vorhanden dann ausführen

 if [ -x ${VARIANT_PATH}/${BUILD_VARIANT}/user_config.sh ]; then
	 ${VARIANT_PATH}/${BUILD_VARIANT}/user_config.sh
	 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/user_config.sh  wird ausgeführt "
	else
	 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/user_config.sh  nicht vorhanden "
 fi

# aus config/includes.chroot/etc/skel wird späteres /home/live/ Verzeichnis

echo "user_config  schreiben "

rsync -avP --exclude=src/ ${VARIANT_PATH}/${BUILD_VARIANT}/user_config*/ config/includes.chroot/etc/skel 

echo "user_config  configuration fertig."

echo "fsfw-uni-stick_user_config.sh  beendet "


