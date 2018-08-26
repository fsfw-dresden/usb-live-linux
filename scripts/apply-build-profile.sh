#!/bin/sh
# verlinkt auto/config-Skript u kopiert config-Ordner aus aktivem Build-Profil

. "`dirname "${0}"`/functions.sh"
cd_repo_root

FSFW_UNI_STICK_CONFIG=$1
echo "FSFW-Uni-Stick ${0} ${FSFW_UNI_STICK_CONFIG} " 

ln -svi profiles/${FSFW_UNI_STICK_CONFIG}/auto/config auto/config
rsync -avP config/${FSFW_UNI_STICK_CONFIG}/config/ config/
