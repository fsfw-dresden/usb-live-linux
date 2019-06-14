#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
#	VERSION: 0.0.4
#
#	CREATED: 2017-09-13
#      REVISION: 2019-06-12

#
# passende System config aktivieren -

echo "FSFW-Uni-Stick System config: variant PATH = ${VARIANT_PATH}  -- variant = ${FSFW_UNI_STICK_VARIANT} "

# link nach config/auto/config erstelen 

rm ./auto/config
ln -s ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT}/config ./auto/config

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

echo " system_config ${FSFW_UNI_STICK_VARIANT} schreiben "
rsync -avP ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT}/system_config/ config
echo " system_config  configuration fertig."


