#!/bin/sh

repo_root() {
        git rev-parse --show-toplevel
}

cd_repo_root() {
        echo "current dir: " $(pwd)
        cd `dirname "${0}"`
        echo "now at $(pwd), finding repo root"
        ROOT=$(repo_root)
        cd "${ROOT}"
}

check_program_exists() {
        [ ! -z $(command -v "${@}") ] && return 0
        echo "Program '${@}' does NOT exist in path, try # apt install ${@}"
        return 1
}

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
