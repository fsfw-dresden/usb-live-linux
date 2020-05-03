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

# shell option: remove non-matching file globs
shopt -s nullglob

# put the configuration fragments where live-build expects them
apply_fragments() {
    local BASE=${@}
    # print_info "apply_fragments( BASE = ${BASE} )"

    for FRAGMENT in ${BASE}/{inherit,inherits,depends,features}/* ${BASE}; do
        if [ ${FRAGMENT} != ${BASE} ] && [ -d ${FRAGMENT} ]; then
            apply_fragments ${FRAGMENT}
        else
            print_info "applying ${FRAGMENT} fragment"

            for CONFPATH in ${!PATH_MAPPINGS[*]}
            do
                # skip if not existent
                [ ! -d ${FRAGMENT}/${CONFPATH} ] && continue

                # special case to derefence base-settings.d symlinks
                [ ${CONFPATH} == "live-build-config" ] && SYMLINK_OPTION='--copy-links' || SYMLINK_OPTION=''

                TARGET=${PATH_MAPPINGS[${CONFPATH}]}
                print_info "TARGET = ${TARGET}"

                [ -d ${TARGET} ] || mkdir -p ${TARGET}
                rsync --archive --checksum -ih ${SYMLINK_OPTION} ${FRAGMENT}/${CONFPATH}/ ${TARGET}/
            done
        fi
    done
}

apply_fragments variants/${BUILD_VARIANT}

print_info "configuration fragments applied"
# vim:ts=4:sts=4:sw=4:expandtab
