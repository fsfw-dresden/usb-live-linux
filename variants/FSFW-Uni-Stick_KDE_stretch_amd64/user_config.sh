#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
# erstellten der user Konfiguration aus Vorlagen von config/${FSFW_UNI_STICK_CONFIG}/user_config/src/...".
#

echo "user_config.sh - FSFW-Uni-Stick: variant PATH = ${VARIANT_PATH}  -- variant = ${FSFW_UNI_STICK_VARIANT} "
REPO_ROOT=$(git rev-parse --show-toplevel)

# z.B. spezielle Doku bzw. abweichende Optionen je nach Desktop

#
# erstellten der user Konfiguration aus Vorlagen von ../../doc/src_fsfw-user_config/*  
#
# aktuallisieren der ../config/includes.chroot/etc/skel/..

echo "../tools/fsfw-user_config.sh ${FSFW_UNI_STICK_CONFIG} ausführen "

${REPO_ROOT}/tools/fsfw-user_config.sh

# ---------------
