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

. "$(dirname $(realpath "${0}"))/functions.sh"
. "$(dirname $(realpath "${0}"))/functions.bash"
cd_repo_root

select_build_variant() {
    shopt -s extglob
    OPTIONS=()
    for VAR in $(command ls -Ltd variants/!(active|base_*|common_*))
    do
        NUMFILES=$(find "${VAR}" -type f -printf x | wc -c)
        # THANKS https://stackoverflow.com/questions/4561895/how-to-recursively-find-the-latest-modified-file-in-a-directory
        NEWESTFILE=$(find ${VAR} -type f -printf '%T@ %p\n'|sort -n|tail -n 1|cut -d" " -f2-)
        [ -z "${NEWESTFILE}" ] && CHANGESTR="" || CHANGESTR=", last changed $(rel_fmt_low_precision $(stat --format='@%Y' "${NEWESTFILE}"))"
        OPTIONS+=(${VAR#variants/} "(${NUMFILES} files${CHANGESTR})")
    done
    TEXT="Please choose the variant to build. (Variants starting with base_ or common_ are not listed)"
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

main() {
    if [ "$(id -u)" != "0" ]; then
        echo " "
        echo "Hinweis: Dieses Skript wird derzeit nicht mit root-Rechten ausgeführt."
        echo "Diese werden bei Bedarf (ggf. mehrfach) abgefragt."
        echo " "
        echo " "
        sleep 1
    fi

    # live-build Umgebung aufräumen; siehe auto/clean
    sudo lb clean

    # variantenspezifische live-build Konfiguration einspielen
    scripts/apply-build-variant.sh ${BUILD_VARIANT}

    # Paketlisten aus markdown konvertieren.
    scripts/md2packagelist.sh variants/${BUILD_VARIANT}{,/features/*}/packages.md
    # workaround (FIXME): lb chroot_package-lists install verschluckt sich bei inaktiven Paketlisten
    find config/package-lists -type f -not -exec grep -q '^[^#]' {} \; -delete

    # Paketlisten nach out-of-repo Paketen durchsuchen und download nach config/packages.chroot/*
    scripts/extra-install-paket.sh ${BUILD_VARIANT}

    # copy FSFW docs
    scripts/copy-docs.sh ${BUILD_VARIANT} /usr/local/share/doc/FSFW-Dresden

    # live user home skeleton erstellen
    scripts/prepare-home-skel.sh ${BUILD_VARIANT}

    # live-build config generieren -- optionaler Zwischenschritt um config manuell anzupassen - wird sonst von "lb build" mit erledigt
    sudo lb config
    sudo chown -Rc ${USER}:${USER} ./config

    # FSFW_UNI_Stick_*.iso bauen
    sudo lb build

    sudo chown -c ${USER}:${USER} ./${BUILD_VARIANT}*.*

    mkdir -pv iso-images && mv -iv ./${BUILD_VARIANT}*.* iso-images/

}


main 2>&1 | tee -a fsfw-build-script.log


