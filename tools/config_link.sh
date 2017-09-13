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


echo " system_config  schreiben "

rsync -avP ../config/${FSFW_UNI_STICK_CONFIG}/system_config/ config/includes.chroot/ 

echo " system_config  configuration fertig."
