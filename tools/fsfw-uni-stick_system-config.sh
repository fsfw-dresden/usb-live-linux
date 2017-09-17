#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
# passende System config aktivieren -

FSFW_UNI_STICK_CONFIG_DEFAULT="FSFW-Uni-Stick_KDE_jessie_amd64"

FSFW_UNI_STICK_CONFIG=$1
echo "config_links.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 

# link nach config/auto/config erstelen 

rm ./auto/config
ln -s ../../config/${FSFW_UNI_STICK_CONFIG}/config ./auto/config

# aufräumen 
# - ist config/includes.chroot/*  vorhanden --> löschen

 if [ -d config/includes.chroot/ ]; then
  rm -R config/includes.chroot/*
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

 if [ -d config/bootloaders/ ]; then
  rm -R config/bootloaders/*
  echo " löschen - config/bootloaders/* "
 fi

 if [ -d config/templates/ ]; then
  rm -R config/templates/*
  echo " löschen - config/templates/* "
 fi


# system_config übernehmen

echo " system_config ${FSFW_UNI_STICK_CONFIG} schreiben "
rsync -avP ../config/${FSFW_UNI_STICK_CONFIG}/system_config/ config
echo " system_config  configuration fertig."


