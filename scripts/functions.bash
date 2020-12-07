#!/bin/bash
# ⚠️  uses bash arrays

# die on error
set -e

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
}

# fetch any external packages specified by URL in package-lists
download_external_deb_packages() {
    WGET_OPTIONS="--no-verbose --timeout=10 --no-http-keep-alive --show-progress --progress=dot:giga --execute content_disposition=off"
    PKG_LISTS=($(command ls config/package-lists/*))

    for PKG_LIST in ${PKG_LISTS[@]}
    do
        while read LINE_START DEB_URL FILE_NAME
        do
            if [ "${LINE_START}" = "# @deb:" ]
            then
                if [ -z ${FILE_NAME} ]
                then
                    FILE_NAME=${DEB_URL##*/}
                    FILE_NAME=${FILE_NAME/-amd64/_amd64}	# korrigiert fehlerhaften Paketnamen - wird sonst nicht installiert)
                fi

                if [ -n "${FILE_NAME}" ]; then
                    if [ -f cache/packages.extra/${FILE_NAME} ]; then
                        echo "${FILE_NAME} available in cache, not downloading."
                    else
                        echo "downloading ${FILE_NAME}"
                        mkdir -p cache/packages.extra
                        if wget ${WGET_OPTIONS} ${DEB_URL} -O cache/packages.extra/${FILE_NAME}.partial
                        then
                            echo "${FILE_NAME} fetched"
                        else
                            echo "Download from ${DEB_URL} failed : ("
                            exit 1
                        fi

                        TMPDIR=$(mktemp --tmpdir --directory deb-pkg-check-XXX)

                        # extract downloaded package to check for basic integrity
                        if dpkg-deb --extract cache/packages.extra/${FILE_NAME}.partial ${TMPDIR}
                        then
                            mv -v cache/packages.extra/${FILE_NAME}{.partial,}
                        else
                            echo "${FILE_NAME} from ${DEB_URL} seems broke, aborting"
                            exit 2
                        fi
                        rm -r "${TMPDIR}"
                    fi
                    mkdir -p config/packages.chroot
                    cp --archive --link cache/packages.extra/${FILE_NAME} config/packages.chroot/
                fi
            fi

        done < ${PKG_LIST}
    done
}

check_dependencies() {
    for DEP in ${@}
    do
         dpkg -s ${DEP} | grep -qs "Status:.*installed" || { DEPS+=( ${DEP} ); echo "${DEP} missing"; }
    done
    [ ${#DEPS[@]} -eq 0 ] && echo "[ ✅ ] all dependencies present (hooray)" && return
    read -n1 -p "press [i] to run \`apt install ${DEPS[@]}\` and proceed, [any other] key to exit the script.."
    [ "$REPLY" = "i" ] && apt install ${DEPS[@]} || echo "dependencies ${DEPS[@]} not installed, aborting"; exit 1
}

# vim:ts=4:sts=4:sw=4:expandtab
