#!/bin/bash
# ⚠️  uses bash arrays

# die on error
set -e

# display_dialog "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
# OPTIONS = ( "entry name" "description" ... )
display_dialog() {
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

check_dependencies() {
    for DEP in ${@}
    do
         dpkg -s ${DEP} | grep -qs "Status:.*installed" || { DEPS+=( ${DEP} ); echo "${DEP} missing"; }
    done
    [ ${#DEPS[@]} -eq 0 ] && echo "[ ✅ ] all dependencies present (hooray)" && return
    read -n1 -p "press [i] to run \`apt install ${DEPS[@]}\` and proceed, [any other] key to exit the script.."
    [ "$REPLY" = "i" ] && apt install ${DEPS[@]} || echo "dependencies ${DEPS[@]} not installed, aborting"; exit 1
}
