#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
# erstellten der user Konfiguration aus config/${FSFW_UNI_STICK_CONFIG}/user_config/*  
# und schreibt sie nach "config/includes.chroot/etc/skel/" und "config/includes.chroot/etc/..."
#

FSFW_UNI_STICK_CONFIG=$1
echo "fsfw-uni-stick_user_config  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 


# aufräumen ( ist ../home/user vorhanden wird die config nicht aus ../etc/skel übernommen)
  if [ -d config/includes.chroot/home/ ]; then
	 rm -R config/includes.chroot/home
	 echo " config/includes.chroot/home gelöscht"
  fi 

# ist skript ../../config/${FSFW_UNI_STICK_CONFIG}/user_config.sh vorhanden dann ausführen

 if [ -x ../config/${FSFW_UNI_STICK_CONFIG}/user_config.sh ]; then
	 ../config/${FSFW_UNI_STICK_CONFIG}/user_config.sh "${FSFW_UNI_STICK_CONFIG}"
	 echo " ../config/${FSFW_UNI_STICK_CONFIG}/user_config.sh  wird ausgeführt "
	else
	 echo " ../config/${FSFW_UNI_STICK_CONFIG}/user_config.sh  nicht vorhanden "
 fi


echo " user_config  schreiben "

rsync -avP --exclude=aux-files/ ../config/${FSFW_UNI_STICK_CONFIG}/user_config/ config/includes.chroot/etc/skel 

echo " user_config  configuration fertig."


# git-versionsnummer / link --> config/includes.chroot/etc/skel/.version_fsfw-uni-stick
#

echo " FSFW_UNI_STICK_VERSION = "$(echo "$(../tools/calc-version-number.sh)")" " > config/includes.chroot/etc/skel/.version_fsfw-uni-stick
echo " git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/etc/skel/.version_fsfw-uni-stick


echo " fsfw-uni-stick_user_config.sh  beendet "
