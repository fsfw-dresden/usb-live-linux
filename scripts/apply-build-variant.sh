#!/bin/sh
# verlinkt auto/config-Skript u kopiert config-Ordner aus aktivem Build-Profil

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

ln -svf ../variants/${BUILD_VARIANT}/system-config/auto/config auto/config
rsync -avP variants/common/system-config/ config/
for link in variants/${BUILD_VARIANT}/inherit/*; do
  rsync -avP ${link}/system-config/ config/
done

rsync -avPc variants/${BUILD_VARIANT}/system-config/ config/
