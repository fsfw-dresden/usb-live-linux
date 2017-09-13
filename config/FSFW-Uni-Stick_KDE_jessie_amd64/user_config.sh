#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
# erstellten der user Konfiguration aus Vorlagen von ../../doc/src_fsfw-user_config/*  
#
# und schreibt sie nach config/${FSFW_UNI_STICK_CONFIG}  user_config/...".
#
#

FSFW_UNI_STICK_CONFIG=$1
echo "user_config.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 


# ist ../config/${FSFW_UNI_STICK_CONFIG}/user_config/ nicht vorhanden angelegt )

  if [ ! -d ../config/${FSFW_UNI_STICK_CONFIG}/user_config/ ]; then
	 mkdir -p ../config/${FSFW_UNI_STICK_CONFIG}/user_config/
	 echo " ../config/${FSFW_UNI_STICK_CONFIG}/user_config erstellt"
  fi

# aktuallisieren der ../config/${FSFW_UNI_STICK_CONFIG}/user_config/..
# 

../tools/fsfw-user_config.sh "${FSFW_UNI_STICK_CONFIG}"

echo "../tools/fsfw-user_config.sh ${FSFW_UNI_STICK_CONFIG} ausführen "

# ---------------

