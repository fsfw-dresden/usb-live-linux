#!/bin/sh
# verlinkt auto/config-Skript u kopiert config-Ordner aus aktivem Build-Profil

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active)
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

ln -sv ../variants/${BUILD_VARIANT}/auto/config auto/config
rsync -avP variants/${BUILD_VARIANT}/config/ config/
