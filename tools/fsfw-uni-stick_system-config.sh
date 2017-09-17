#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
# passende Config aktivieren - link nach config/auto/config erstelen 

# Configuration einspielen

FSFW_UNI_STICK_CONFIG_DEFAULT="FSFW-Uni-Stick_KDE_jessie_amd64"

FSFW_UNI_STICK_CONFIG=$1
echo "config_links.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 

# TUDO: testen ob Verzeichnis und config vorhanden existieren

if [[ -z ${FSFW_UNI_STICK_CONFIG} ]]; then
    FSFW_UNI_STICK_CONFIG=${FSFW_UNI_STICK_CONFIG_DEFAULT}
    echo "FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 
fi

rm ./auto/config
ln -s ../../config/${FSFW_UNI_STICK_CONFIG}/config ./auto/config


# passende system configuration aktivieren
# aufräumen ( ist config/includes.chroot/etc/  vorhanden --> löschen )

 if [ -d config/includes.chroot/etc/ ]; then
  rm -R config/includes.chroot/etc/*
  echo " löschen - config/includes.chroot/* "
 fi


 if [ -d config/apt/ ]; then
  rm -R config/apt/*
  echo " löschen - config/apt/* "
 fi


 if [ -d config/packages.chroot/ ]; then
  rm -R config/packages.chroot/*
  echo " löschen - config/packages.chroot/* "
 fi

 if [ -d config/archives/ ]; then
  rm -R config/archives/*
  echo " löschen - config/archives/* "
 fi

echo " system_config  schreiben "
# rsync -avP ../config/${FSFW_UNI_STICK_CONFIG}/system_config config
rsync -avP ../config/${FSFW_UNI_STICK_CONFIG}/system_config/ config
echo " system_config  configuration fertig."


