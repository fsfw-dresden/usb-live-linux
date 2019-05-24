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

. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

[ -d "variants/${BUILD_VARIANT}" ] || { echo "FAIL: variants/active not symlink pointing to valid config variant"; exit 1; }

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
    scripts/apply-build-variant.sh

    # Paketlisten aus markdown konvertieren.
    scripts/md2packagelist.sh variants/${BUILD_VARIANT}/paketlisten/default
    # workaround (FIXME): lb chroot_package-lists install verschluckt sich bei inaktiven Paketlisten
    find config/package-lists -type f -not -exec grep -q '^[^#]' {} \; -delete

    # Paketlisten nach out-of-repo Paketen durchsuchen und download nach config/packages.chroot/*
    scripts/extra-install-paket.sh

    # live user home skeleton erstellen
    scripts/prepare-home-skel.sh

    # live-build config generieren -- optionaler Zwischenschritt um config manuell anzupassen - wird sonst von "lb build" mit erledigt
    sudo lb config
    sudo chown -Rc ${USER}:${USER} ./config

    # FSFW_UNI_Stick_*.iso bauen
    sudo lb build

    sudo chown -c ${USER}:${USER} ./FSFW-Uni-Stick*.iso

    mkdir -pv iso-images && mv -iv ./FSFW-Uni-Stick*.iso iso-images/

}


main 2>&1 | tee -a fsfw-build-script.log


