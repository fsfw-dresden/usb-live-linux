#!/bin/bash
#===========================================
#         FILE: build-live-system.sh
#  DESCRIPTION: erstellen des FSFW-Uni-Stick
#        	Nutzung verschiedener Konfigurationsvarianten möglich
#		alle Schritte in diesem Skript können auch einzeln ausgeführt werden
#
#      VERSION: 0.1.4
#        NOTES: für - live-build - Debian jessie / Debian stretch - LANG=de_DE.UTF-8
#
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#      CREATED: 2016-10-21
#     REVISION: 2018-10-19
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================

# exit on error
set -e

. "$(dirname $(realpath "${0}"))/functions.sh"
. "$(dirname $(realpath "${0}"))/functions.bash"
cd_repo_root

# give some rudimentary help if requested
case "${1}" in
    "-h")
        ;&
    "--help")
        print_info "usage is ${0} [BUILD_VARIANT]"
        print_info "If given, BUILD_VARIANT must match a sub-folder or symlink in variants/"
        exit
        ;;
esac

select_build_variant() {
    shopt -s extglob
    OPTIONS=()
    for VAR in $(command ls -Ltd variants/!(active|base_*|shared))
    do
        NUMFILES=$(find "${VAR}" -type f -printf x | wc -c)
        # THANKS https://stackoverflow.com/questions/4561895/how-to-recursively-find-the-latest-modified-file-in-a-directory
        NEWESTFILE=$(find ${VAR} -type f -printf '%T@ %p\n'|sort -n|tail -n 1|cut -d" " -f2-)
        [ -z "${NEWESTFILE}" ] && CHANGESTR="" || CHANGESTR=", last changed $(rel_fmt_low_precision $(stat --format='@%Y' "${NEWESTFILE}"))"
        OPTIONS+=(${VAR#variants/} "(${NUMFILES} files${CHANGESTR})")
    done
    TEXT="Please choose the variant to build. (Variants named base_* or shared are not listed)"
    TITLE="SELECT LIVE SYSTEM BUILD VARIANT"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

# if a 'active' symlink exists, parse that
[ -e variants/active ] && BUILD_VARIANT=$(readlink variants/active)

# if a BUILD_VARIANT is given as parameter, prefer that
[ -n "${1}" ] && BUILD_VARIANT=$1

# if neither, query user to visually select a variant
[ -n "${BUILD_VARIANT}" ] || BUILD_VARIANT=$(select_build_variant)
BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

# ensure the directory exists
[ -d "variants/${BUILD_VARIANT}" ] || { print_warn "given BUILD_VARIANT=${BUILD_VARIANT} does not exist" >&2 && exit 1; }

if [ "$(id -u)" != "0" ]; then
    print_warn "ERROR: no super-user privilege, please run as root or with sudo."
    print_warn "Running this script without sudo is not supported anymore!"
    exit 3
fi

# clean up live-build environment using auto/clean script
lb clean

# generate live-build config for specified variant
scripts/apply-build-variant.sh ${BUILD_VARIANT}

# set shell option: remove non-matching file globs
shopt -s nullglob

# copy FSFW docs (FIXME: convert into feature)
scripts/copy-docs.sh ${BUILD_VARIANT} /usr/local/share/doc/FSFW-Dresden

# generate live-user home directory "skeleton"
scripts/prepare-home-skel.sh ${BUILD_VARIANT}

# have live-build complete its config
lb config

# convert package lists from markdown
scripts/md2packagelist.sh config/package-lists.markdown/*.md

# workaround (FIXME): lb chroot_package-lists install verschluckt sich bei inaktiven Paketlisten
find config/package-lists -type f -not -exec grep -q '^[^#]' {} \; -print -delete|sed 's/^/WORKAROUND/'

# fetch any external packages specified by URL in package-lists
scripts/extra-install-paket.sh

# HACK: modify build script to unlock zstd mksquashfs power
sed -i 's/comp xz/comp zstd/' /usr/lib/live/build/binary_rootfs

# Trigger image build
lb build && \
    mkdir -pv iso-images && \
    mv -iv ./${BUILD_VARIANT}*.* iso-images/
