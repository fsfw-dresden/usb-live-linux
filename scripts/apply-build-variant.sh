#!/bin/bash
# assembling configuration fragments and put them where live-build expects

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$1
[ -n "${BUILD_VARIANT}" ] || { print_warn "ERROR no BUILD_VARIANT parameter given" >&2 && exit 1; }
echo "Live-Stick ${0} ${BUILD_VARIANT}"

# use associative arrays (bash v4+)
declare -A DISABLED_FRAGMENTS
declare -A FRAGMENTS
declare -a FRAGMENT_IDS
declare -A PATH_MAPPINGS
PATH_MAPPINGS[package-preferences]="config/archives"
PATH_MAPPINGS[package-repos]="config/archives"
PATH_MAPPINGS[package-include]="config/packages.chroot"
PATH_MAPPINGS[livefs-hooks]="config/hooks/normal"
PATH_MAPPINGS[livefs-include]="config/includes.chroot"
PATH_MAPPINGS[live-build-config]="config"
PATH_MAPPINGS[user-config]="config/includes.chroot/etc/skel"
PATH_MAPPINGS[packages.md]="config/package-lists.markdown"

# shell option: remove non-matching file globs
shopt -s nullglob

parse_fragments() {
    local BASE=${@}
    #print_info "parse_fragments( BASE = ${BASE} )"

    for FRAGMENT_PATH in ${BASE}/{inherit,inherits,depends,features}/* ${BASE}; do
        if [ ${FRAGMENT_PATH} != ${BASE} ] && [ -d ${FRAGMENT_PATH} ]; then
            parse_fragments ${FRAGMENT_PATH}
        else
            #print_info "found ${FRAGMENT_PATH} fragment"
            FRAGMENT_ID=${FRAGMENT_PATH##*/}
            if [[ "${FRAGMENT_PATH}" =~ .disable$ ]]; then
                FRAGMENT_ID=${FRAGMENT_ID%.disable}
                DISABLED_FRAGMENTS[${FRAGMENT_ID}]=${FRAGMENT_PATH}
            else
                FRAGMENTS[${FRAGMENT_ID}]=${FRAGMENT_PATH}
                FRAGMENT_IDS+=( ${FRAGMENT_ID} )
            fi
        fi
    done

    #print_info "DISABLED_FRAGMENTS=${!DISABLED_FRAGMENTS[@]}"
}

apply_fragments() {
    FRAGMENT_COUNT=0

    for FRAGMENT_ID in "${FRAGMENT_IDS[@]}"; do
        FRAGMENT_PATH=${FRAGMENTS[${FRAGMENT_ID}]}

        if [[ -v DISABLED_FRAGMENTS[${FRAGMENT_ID}] ]]; then
            print_warn "skipping ${FRAGMENT_ID} fragment, disabled by ${DISABLED_FRAGMENTS[${FRAGMENT_ID}]}"
        else
            print_info "applying ${FRAGMENT_ID} fragment (from ${FRAGMENT_PATH})"

            for CONFPATH in ${!PATH_MAPPINGS[*]}
            do
                # skip if not existent
                [ ! -e ${FRAGMENT_PATH}/${CONFPATH} ] && continue

                TARGET=${PATH_MAPPINGS[${CONFPATH}]}
                print_info "TARGET = ${TARGET}"
                [ -d ${TARGET} ] || mkdir -p ${TARGET}

                # special cases
                case ${CONFPATH} in
                    "packages.md")
                        # do not handle main package list of inherited build variants
                        [[ ${FRAGMENT_PATH} =~ inherit/[^/]+$ ]] && continue
                        cp -via ${FRAGMENT_PATH}/${CONFPATH} ${TARGET}/${FRAGMENT_ID}_${CONFPATH}
                        ;;
                    "live-build-config")
                        # derefence base-settings.d symlinks
                        rsync --archive --checksum -ih --copy-links ${FRAGMENT_PATH}/${CONFPATH}/ ${TARGET}/
                        ;;
                    *)
                        rsync --archive --checksum -ih ${SYMLINK_OPTION:-} ${FRAGMENT_PATH}/${CONFPATH}/ ${TARGET}/
                        ;;
                esac
            done

            ((++FRAGMENT_COUNT))
        fi
    done
    print_info "${FRAGMENT_COUNT} configuration fragments applied, ${#DISABLED_FRAGMENTS[@]} skipped."
}

parse_fragments variants/${BUILD_VARIANT}
apply_fragments

# vim:ts=4:sts=4:sw=4:expandtab
