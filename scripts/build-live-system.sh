#!/bin/bash +x
#===========================================
#         FILE: build-live-system.sh
#  DESCRIPTION: erstellen des FSFW-Uni-Stick
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#      CREATED: 2016-10-21
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================

TARGET_DIR=artifacts

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

# if an 'active' symlink exists, parse that (DEPRECATED)
[ -e variants/active ] && BUILD_VARIANT=$(readlink variants/active)

# if a BUILD_VARIANT is given as parameter, prefer that
[ -n "${1}" ] && BUILD_VARIANT=$1

# if neither, query user to visually select a variant
[ -n "${BUILD_VARIANT}" ] || BUILD_VARIANT=$(select_build_variant)
BUILD_VARIANT=${BUILD_VARIANT%/}

# Clear selection dialog from screen
clear

echo "Live-Stick ${0} ${BUILD_VARIANT}" 

# ensure the directory exists
[ -d "variants/${BUILD_VARIANT}" ] || { print_warn "given BUILD_VARIANT=${BUILD_VARIANT} does not exist" >&2 && exit 1; }

if [ "$(id -u)" != "0" ]; then
    print_warn "ERROR: no super-user privilege, please run as root or with sudo."
    print_warn "Running this script without sudo is not supported anymore!"
    exit 3
fi

print_info "Available live-build versions:"
apt policy live-build
print_info "Using live-build $(lb --version), lb command is $(type lb)"

print_info "Firing build process, fasten seatbelts.. it is $(date '+%F %H:%M') now."
STARTTIME=$(date +%s)

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

# fetch external deb files specified by URL in package-list
download_external_deb_packages

# HACK: modify build script to unlock zstd mksquashfs power
sed -i 's/comp xz/comp zstd/' /usr/lib/live/build/binary_rootfs

# Trigger image build
lb build \
    && {
    print_info "Build SUCCEEDED"

        # Ensure TARGET_DIR exists
        mkdir -p ${TARGET_DIR}

        # and move generated files there
        mv -iv ./"${BUILD_VARIANT}"*.* ${TARGET_DIR}/

        } \
    || print_warn "Build FAILED"

print_info "this took $(format_timespan $(($(date +%s) - ${STARTTIME}))) and the work of many"
