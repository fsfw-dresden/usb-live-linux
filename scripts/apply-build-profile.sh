#!/bin/sh
# verlinkt auto/config-Skript u kopiert config-Ordner aus aktivem Build-Profil

. "`dirname "${0}"`/functions.sh"
cd_repo_root

FSFW_UNI_STICK_CONFIG=$1
echo "FSFW-Uni-Stick ${0} ${FSFW_UNI_STICK_CONFIG} " 

ln -sv profiles/${FSFW_UNI_STICK_CONFIG}/auto/config auto/config
rsync -avP profiles/${FSFW_UNI_STICK_CONFIG}/system_config/ config/
