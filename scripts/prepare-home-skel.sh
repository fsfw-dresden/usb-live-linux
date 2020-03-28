#!/bin/sh
# aus config/includes.chroot/etc/skel wird späteres /home/user/ Verzeichnis

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

mkdir -pv config/includes.chroot/etc/skel
for DIR in variants/${BUILD_VARIANT}/inherit/* variants/${BUILD_VARIANT}; do
  USER_SKEL=${DIR}/user-config
  [ -d ${USER_SKEL} ] && rsync --archive --stats --info=progress2 --checksum ${USER_SKEL} config/includes.chroot/etc/skel/
done

# copy FSFW-Material & latex-vorlagen
rsync -aih FSFW-Material config/includes.chroot/etc/skel/
# Hinweis: Zur besseren Sichtbarkeit der LaTeX-Vorlagen leben diese seit Mai 2018 in einem eigenen Repo:
# <https://github.com/fsfw-dresden/latex-vorlagen>.
git submodule update --init --recursive
rsync -aP --exclude=.git* doc/latex-vorlagen/ config/includes.chroot/etc/skel/FSFW-Material/latex-vorlagen

ln -sv /usr/local/share/doc/FSFW-Dresden config/includes.chroot/etc/skel/FSFW-Material/stick-doku

echo "schreibe git-versionsnummer & URL in HOME/.version-live-stick"

{
  echo "this live-stick ISO was built $(date '+%F %R')"
  echo "stick-version $(scripts/calc-version-number.sh)"
  echo "git-revision $(git rev-parse master)"
  echo "https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)"
} > config/includes.chroot/etc/skel/.version-live-stick

echo "${0} beendet"
