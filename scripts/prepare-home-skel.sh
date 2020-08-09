#!/bin/sh
# aus config/includes.chroot/etc/skel wird späteres /home/user/ Verzeichnis

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$1
[ -n "${BUILD_VARIANT}" ] || { print_warn "ERROR no BUILD_VARIANT parameter given" >&2 && exit 1; }
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

mkdir -pv config/includes.chroot/etc/skel

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
  echo "git-revision $(git rev-parse HEAD)"
  echo "https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse HEAD)"
} > config/includes.chroot/etc/skel/.version-live-stick

echo "${0} beendet"
