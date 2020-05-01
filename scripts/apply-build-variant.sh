#!/bin/bash

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$1
[ -n "${BUILD_VARIANT}" ] || { print_warn "ERROR no BUILD_VARIANT parameter given" >&2 && exit 1; }
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

# use an associative array (bash v4+)
declare -A PATH_MAPPINGS
PATH_MAPPINGS[package-preferences]="config/archives"
PATH_MAPPINGS[package-repos]="config/archives"
PATH_MAPPINGS[package-include]="config/packages.chroot"
PATH_MAPPINGS[livefs-hooks]="config/hooks/normal"
PATH_MAPPINGS[livefs-include]="config/includes.chroot"
PATH_MAPPINGS[live-build-config]="config"
PATH_MAPPINGS[user-config]="config/includes.chroot/etc/skel"

# put the configuration fragments where live-build expects them
for FRAGMENT in variants/${BUILD_VARIANT}/{inherit,features}/* variants/${BUILD_VARIANT}; do
  for CONFPATH in ${!PATH_MAPPINGS[*]}
  do
    # special case to derefence the base-settings.d symlinks
    [ ${CONFPATH} == "live-build-config" ] && SYMLINK_OPTION='--copy-links' || SYMLINK_OPTION=''

    TARGET=${PATH_MAPPINGS[${CONFPATH}]}
    [ -d ${FRAGMENT}/${CONFPATH} ] && \
        mkdir -p ${TARGET} && \
        rsync --archive --checksum ${SYMLINK_OPTION} ${FRAGMENT}/${CONFPATH}/ ${TARGET}/
  done
done

print_info "configuration fragments applied"
