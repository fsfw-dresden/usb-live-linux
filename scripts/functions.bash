#!/bin/bash
# ⚠️  uses associative arrays (bash v4+)

# FIXME: workaround for prebuild-hooks, have to include this for the logging functions
[ -e scripts/functions.sh ] && . scripts/functions.sh
[ -e ../scripts/functions.sh ] && . ../scripts/functions.sh

# abort if any sub-command produces an error
set -o errexit -o errtrace
trap 'print_error "Sorry, something went wrong."' ERR

# takes a number of seconds and outputs a
# nice human-readable time string
function format_timespan {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%d days ' $D
  [[ $H > 0 ]] && printf '%d hours ' $H
  [[ $M > 0 ]] && printf '%d minutes ' $M
  [[ $D > 0 || $H > 0 || $M > 0 ]] && printf 'and '
  printf '%d seconds\n' $S
}

# display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
# OPTIONS = ( "entry name" "description" ... )
display_menu() {
    TITLE=$1 && shift
    TEXT=$1 && shift
    OPTIONS=( "${@}" )
    # make dialog 80% of terminal width/height
    WIDTH=$((80 * $(tput cols) / 100))
    HEIGHT=$((80 * $(tput lines) / 100))
    MAXMENUHEIGHT=20
    COLORS=( "tag_selected_color = (WHITE,BLUE,ON)" "item_selected_color = item_color" "tag_key_color = tag_color" "tag_key_selected_color = tag_selected_color" )
    DIALOGRC=<(printf '%s\n' "${COLORS[@]}") dialog --stdout --title "${TITLE}" --menu "${TEXT}" ${HEIGHT} ${WIDTH} ${MAXMENUHEIGHT} "${OPTIONS[@]}"

    # redraw screen without erasing backscroll history
    clear -x > /dev/stderr
}

display_inputbox() {
    TITLE=$1
    TEXT=$2
    INIT=$3
    # make dialog 80% of terminal width/height
    WIDTH=$((80 * $(tput cols) / 100))
    HEIGHT=$((80 * $(tput lines) / 100))
    MAXMENUHEIGHT=20
    COLORS=( "tag_selected_color = (WHITE,BLUE,ON)" "item_selected_color = item_color" "tag_key_color = tag_color" "tag_key_selected_color = tag_selected_color" )
    DIALOGRC=<(printf '%s\n' "${COLORS[@]}") dialog --stdout --title "${TITLE}" --inputbox "${TEXT}" ${HEIGHT} ${WIDTH} ${INIT}

    # redraw screen without erasing backscroll history
    clear -x > /dev/stderr
}

get_cached() {
    CACHE_DIR="cache/packages.extra"
    OBJECT_ID=${1##*/}

    OBJECT_CACHED="${CACHE_DIR}/${OBJECT_ID}"
    if [ -e "${OBJECT_CACHED}" ]; then
        echo "${OBJECT_ID} available in cache, not downloading." > /dev/stderr
        echo "${OBJECT_CACHED}"
    else
        return 1
    fi
}

cache_store() {
    CACHE_DIR="cache/packages.extra"
    OBJECT_PATH=${1}
    OBJECT_ID=${2}

    # If no object ID given, use object name
    [ -z "${OBJECT_ID}" ] && OBJECT_ID="${OBJECT_PATH##*/}"

    mkdir -p "${CACHE_DIR}"
    cp -a "${OBJECT_PATH}" "${CACHE_DIR}/${OBJECT_ID}" \
        && echo "stored ${OBJECT_PATH} in ${CACHE_DIR} as ${OBJECT_ID}" > /dev/stderr
}

download_file_cached() {
    FILE_URL=${1}
    FILE_NAME=${2}

    if [ -z ${FILE_NAME} ]
    then
        FILE_NAME=${FILE_URL##*/}
    fi

    CACHE_DIR="cache/packages.extra"
    FILE_CACHED="${CACHE_DIR}/${FILE_NAME%&*}" # remove trailing URL params

    # Set custom user-agent string, turn on location following, timestamp files
    # and disable SSL certificate checking as well as BEAST workaround
    CURL_DEFAULT="--user-agent org.schulstick.build --location --no-keepalive \
                  --remote-time --insecure --ssl-allow-beast --connect-timeout 10"

    if [ -f "${FILE_CACHED}" ]; then
        echo "${FILE_NAME} available in cache, not downloading." > /dev/stderr
    else
        echo "downloading ${FILE_NAME}" > /dev/stderr
        mkdir -p "${CACHE_DIR}"

        # curl will interpret an empty string parameter as URL and give an error,
        # so fill the variable with an option already stated above (NOOP)
        [ -z "${CURL_OPTIONS}" ] && CURL_OPTIONS="--no-keepalive"

        if eval curl ${CURL_DEFAULT} "${CURL_OPTIONS}" --output "\"${FILE_CACHED}.partial\"" "'${FILE_URL}'"
        then
            echo "${FILE_NAME} fetched" > /dev/stderr
        else
            die "Download from ${FILE_URL} failed : (" > /dev/stderr
        fi

        # If this is a debian archive, test for integrity
        if [[ "${DEB_FILE}" =~ \.deb$ ]] && ! check_debian_archive ${DEB_FILE}
        then
            die "${DEB_FILE} seems broke, aborting" > /dev/stderr
        fi

        # Rename file in cache
        mv "${FILE_CACHED}"{.partial,} > /dev/stderr
    fi

    echo "${FILE_CACHED}"
}

check_debian_archive() {
    DEB_FILE=${1}
    TMPDIR=$(mktemp --tmpdir --directory deb-pkg-check-XXX)
    trap "rm -r \"${TMPDIR}\"" RETURN

    # extract downloaded package to check for basic integrity
    if dpkg-deb --extract ${DEB_FILE} ${TMPDIR}
    then
        return 0
    else
        return 2
    fi
}

# fetch any external packages specified by URL in package-lists
download_external_deb_package() {
    DEB_URL=${1}
    FILE_NAME=${2}

    if [ -z "${FILE_NAME}" ]
    then
        FILE_NAME=${DEB_URL##*/}
        FILE_NAME=${FILE_NAME/-amd64/_amd64}	# korrigiert fehlerhaften Paketnamen - wird sonst nicht installiert?)
    fi

    FILE_CACHED=$(download_file_cached "${DEB_URL}" "${FILE_NAME}")

    if [ -n "${FILE_CACHED}" ]
    then
        echo "${FILE_NAME} fetched"
    else
        die "Download from ${DEB_URL} failed : ("
    fi

    TARGET_DIR=config/packages.chroot
    mkdir -p "${TARGET_DIR}"
    cp --archive --link "${FILE_CACHED}" "${TARGET_DIR}/"
}

check_dependencies() {
    for DEP in ${@}
    do
         dpkg -s ${DEP} | grep -qs "Status:.*installed" || { DEPS+=( ${DEP} ); echo "${DEP} missing"; }
    done
    [ ${#DEPS[@]} -eq 0 ] && print_success "Dependencies present (${@})" && return
    read -n1 -p "press [i] to run \`apt install ${DEPS[@]}\` and proceed, [any other] key to exit the script.."
    [ "$REPLY" = "i" ] && apt install ${DEPS[@]} || die "dependencies ${DEPS[@]} not installed, aborting"
}

# FIXME: legacy implementation
# better package list syntax than markdown?!
convert_markdown_list() {
    local TARGET_PATH=config/package-lists
    local DATUM=$(date +%Y-%m-%d)
    local MARKDOWN_LIST=$1

    mkdir -pv ${TARGET_PATH}

    # FIXME: kill section headers
    # placeholder list: support missing headers in [feature]/packages.md
    TARGET_LIST_CHROOT=${TARGET_PATH}/uncategorized.list.chroot

    # Causes MD link strings to not be transferred to subshell
    shopt -u nullglob

    while read FULLLINE
    do
        local MARKDOWN_LIST_INCLUDED=$(echo ${FULLLINE}|sed -nr 's|.*]\((.*\.md)\).*|\1|p')
        # remove -- Beschreibung suffix
        line=${FULLLINE%%  -*}
        STATE=${line%%  *}
        ENTRY=${line##*  }
        case "${STATE}" in
            "##")
                # replace all spaces with underscore
                TARGET_LIST_CHROOT=${TARGET_PATH}/${ENTRY// /_}.list.chroot
                TARGET_LIST_BIN=${TARGET_PATH}/${ENTRY// /_}.list.binary
                [ -e ${TARGET_LIST_CHROOT} ] || echo "#  Package list auto-generated by md2packagelist - ${DATUM}" >> ${TARGET_LIST_CHROOT}

                echo "schreibe Paketliste: ${TARGET_LIST_CHROOT}"
            ;;
            "- ###")
                echo "### ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- ### :o:")
                echo "### ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- ### :x:")
                MARKDOWN_PATH="$(dirname $(realpath --relative-to=. "${MARKDOWN_LIST}"))/${MARKDOWN_LIST_INCLUDED}"
                echo " including ${MARKDOWN_LIST_INCLUDED}"
                convert_markdown_list "${MARKDOWN_PATH}"
                echo " ${MARKDOWN_LIST_INCLUDED} included"
            ;;
            "- :x:")
                echo ${ENTRY} >> ${TARGET_LIST_CHROOT}
            ;;
            "- :+1:")
                echo "# ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- :+1: :x:")
                URL=$(echo ${ENTRY}|sed -rn 's/.*\((.*)\).*/\1/p')
                download_external_deb_package "${URL}"
                echo "# @deb: ${URL}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- :o:")
                echo "## ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- [x]")
                echo "# ${ENTRY}" >> ${TARGET_LIST_BIN}
            ;;
        #    "- [ ]")
        #       echo "# ${ENTRY}" >> ${TARGET_LIST_BIN}
        #    ;;
            *)
                [ -z "${FULLLINE}" ] || echo " Unbekannt: ${FULLLINE}"
            ;;  
        esac

    done < ${MARKDOWN_LIST}
    echo "${MARKDOWN_LIST} converted"
}

# Read image file name
get_image_name() {
    [ -e config/common ] || die "Could not read image name from config/common\nPWD=${PWD}\n$(ls -lah config/)"
    sed -nr 's/LB_IMAGE_NAME="(.*)"$/\1/p' config/common
}

# Recursive function to collect complete list of features
parse_features() {
    local BASE=${@}
    #print_info "parse_features( BASE = ${BASE} )"

    # shell option: swallow mon-matching / empty file globs
    # "If  set,  bash  allows patterns which match no files
    # to expand to a null string, rather than themselves."
    shopt -q nullglob || shopt -s nullglob

    for FEATURE_PATH in ${BASE}/{inherit,inherits,depends,features}/* ${BASE}; do
        if [ ${FEATURE_PATH} != ${BASE} ] && [ -d ${FEATURE_PATH} ]
        then
            parse_features "${FEATURE_PATH}"
        else
            #print_info "found ${FEATURE_PATH} feature"
            FEATURE_ID=${FEATURE_PATH##*/}
            if [[ "${FEATURE_PATH}" =~ " " ]]
            then
                die "${FEATURE_PATH} contains spaces, please fix that."
            fi

            if [[ "${FEATURE_PATH}" =~ \.disable[d]*$ ]]
            then
                # Feature has been marked as disabled
                FEATURE_ID=${FEATURE_ID%.disable*}
                DISABLED_FEATURES[${FEATURE_ID}]=${FEATURE_PATH}
            elif [ ${#FEATURES[${FEATURE_ID}]} -eq 0 ]
            then
                # Feature is not yet in list, so add it
                FEATURES[${FEATURE_ID}]=${FEATURE_PATH}
                FEATURE_IDS+=( ${FEATURE_ID} )
            else
                echo "${FEATURE_ID} already set from ${FEATURES[${FEATURE_ID}]}, skipping adding for ${FEATURE_PATH}"
            fi
        fi
    done
}

# Puts files in the locations live-build expects them
apply_features() {
    declare -A PATH_MAPPINGS
    # FIXME: »This effectively means […] you can't rely on a specific order [when handling associative arrays].«
    # FIXME: »If you want to store ordered data, or re-order data, go with numerical indexes.«
    #           ( from https://wiki.bash-hackers.org/syntax/arrays#associative_bash_4 )

    # for building the intermediate ISO image
    PATH_MAPPINGS[packages.apt]="config/package-lists"
    PATH_MAPPINGS[base-setting]="config/base-settings.d"
    PATH_MAPPINGS[live-build-config]="config"
    PATH_MAPPINGS[livefs-hooks]="config/hooks/normal"
    PATH_MAPPINGS[livefs-include]="config/includes.chroot"
    PATH_MAPPINGS[package-include]="config/packages.chroot"
    PATH_MAPPINGS[package-preferences]="config/archives"
    PATH_MAPPINGS[package-repos]="config/archives"
    PATH_MAPPINGS[packages.md]="config/package-lists.markdown"
    PATH_MAPPINGS[prebuild-hooks]=""
    PATH_MAPPINGS[user-config]="config/includes.chroot/etc/skel"

    # for installing on device / into image
    # (creates the fancy persistence partition layout)
    PATH_MAPPINGS[install-hooks]="install/hooks"
    PATH_MAPPINGS[install-data]="install/data"

    FEATURE_COUNT=0

    # Walk the feature list and apply all fragments of each
    for FEATURE_ID in "${FEATURE_IDS[@]}"; do
        FEATURE_PATH=${FEATURES[${FEATURE_ID}]}

        if [[ -v DISABLED_FEATURES[${FEATURE_ID}] ]]; then
            print_warn "skipping ${FEATURE_ID} feature, disabled by ${DISABLED_FEATURES[${FEATURE_ID}]}"
        else
            print_info "applying ${FEATURE_ID} feature (from ${FEATURE_PATH#../})"

            # FIXME: sorting alphabetically works for now by sheer coincidence
            for FRAGMENT_PATH in $(printf '%s\0' ${!PATH_MAPPINGS[*]} | sort -z | tr '\0' '\n')
            do
                # Skip if feature does not provide this fragment
                [ ! -e ${FEATURE_PATH}/${FRAGMENT_PATH} ] && continue

                # Get target path for fragment type, print and create it (if set)
                TARGET_PATH=${PATH_MAPPINGS[${FRAGMENT_PATH}]}
                [ -z ${TARGET_PATH} ] || {
                    print_info " ~> ${TARGET_PATH}"
                    [ -d ${TARGET_PATH} ] || mkdir -p ${TARGET_PATH}
                }

                case ${FRAGMENT_PATH} in
                    live-build-config)
                        # derefence base-settings.d symlinks
                        rsync --archive --checksum -ih --copy-links ${FEATURE_PATH}/${FRAGMENT_PATH}/ ${TARGET_PATH}/
                        ;;
                    packages.apt)
                        # Skip main package list of inherited build variants
                        [[ ${FEATURE_PATH} =~ inherit/[^/]+$ ]] && continue
                        TARGET_LIST=${TARGET_PATH}/${FEATURE_ID}.list.chroot

                        # comments have to be put on their own line or they will be evaluated as package name list
                        sed -r 's/(.*)\s+(#.*)/\2:\n\1/' ${FEATURE_PATH}/${FRAGMENT_PATH} > ${TARGET_LIST}

                        # download .deb URLs on lines beginning with '<'
                        for URL in "$(sed -rn 's/^<\s+(\S+)\s*.*/\1/p' ${TARGET_LIST})"
                        do
                            [ -n "${URL}" ] && download_external_deb_package "${URL}"
                        done

                        # after downloading, replace '<'-markers with comment
                        sed -ri 's/^<\s+/# @deb: /g' ${TARGET_LIST}
                        ;;
                    packages.md)
                        # Skip main package list of inherited build variants
                        [[ ${FEATURE_PATH} =~ inherit/[^/]+$ ]] && continue
                        TARGET_MD=${TARGET_PATH}/${FEATURE_ID}_${FRAGMENT_PATH}

                        cp -a ${FEATURE_PATH}/${FRAGMENT_PATH} ${TARGET_MD}
                        convert_markdown_list ${TARGET_MD}
                        ;;
                    prebuild-hooks)
                        for HOOK in ${FEATURE_PATH}/${FRAGMENT_PATH}/*
                        do
                            sh -xc "${HOOK}"
                        done
                        ;;
                    *)
                        # the general case: copy fragment
                        rsync --archive --checksum -ih ${FEATURE_PATH}/${FRAGMENT_PATH}/ ${TARGET_PATH}/
                        ;;
                esac
            done

            ((++FEATURE_COUNT))
        fi
    done

    DISABLED_FEATURE_COUNT=${#DISABLED_FEATURES[@]}
    print_info "${FEATURE_COUNT} feature configurations applied, ${DISABLED_FEATURE_COUNT} skipped."
    [ ${DISABLED_FEATURE_COUNT} -eq 0 ] || print_info "disabled features: ${!DISABLED_FEATURES[@]}\n\n"
}

transmogrify_features() {
    declare -A DISABLED_FEATURES
    declare -A FEATURES
    declare -a FEATURE_IDS
    parse_features ${@}
    apply_features
    unset DISABLED_FEATURES FEATURES FEATURE_IDS
}

# vim:ts=4:sts=4:sw=4:expandtab
