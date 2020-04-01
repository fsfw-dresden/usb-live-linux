#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# konvertierte Paketlisten nach mit "--extra--installation" markierten
# Paketen durchsuchen und download nach config/packages.chroot/*
#
. "$(dirname "${0}")/functions.sh"
cd_repo_root

BUILD_VARIANT=$1
[ -n "${BUILD_VARIANT}" ] || { print_warn "ERROR no BUILD_VARIANT parameter given" >&2 && exit 1; }
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

DOWNLOAD="wget -nv -T10 --no-http-keep-alive --show-progress --progress=dot:giga -c -e content_disposition=off"
PAKET_LISTEN=($(command ls config/package-lists/*))

echo "Extra Paket-Installation für packages.chroot vorbereiten."

# Paketlisten nach "## --extra--installation -->" Paketen durchsuchen

for paket_liste in ${PAKET_LISTEN[@]}
  do
	while read line
	do
	    case "${line%%"  "*}" in
	    "## --extra--installation -->")
		# echo "download = ${line##*-->}"
		paket_quelle=${line##*-->}
		paket=${paket_quelle##*/}
		paket=${paket/-amd64/_amd64}	# korrigiert fehlerhaften Paketnamen - wird sonst nicht installiert)

		if [ -n "${paket}" ]; then
			mkdir -pv {cache,config}/packages.chroot
			if [ -f cache/packages.chroot/${paket} ]; then
				echo "${paket} im cache verfügbar"
			else
				echo "downloade ${paket}"
				${DOWNLOAD} ${paket_quelle} -O cache/packages.chroot/${paket}.partial \
					&& echo "${paket} - geholt" \
					|| { echo "Download fehlgeschlagen"; exit 1; }
				TMPDIR=$(mktemp --tmpdir --directory deb-pkg-check-XXX)
				trap "rm -r /tmp/deb-pkg-check-???" EXIT SIGHUP SIGQUIT SIGTERM
				dpkg-deb --extract cache/packages.chroot/${paket}.partial ${TMPDIR} \
					|| { echo "${paket} kaputt?"; exit 2; }
				mv -v cache/packages.chroot/${paket}{.partial,}
			fi
			cp -a {cache,config}/packages.chroot/${paket}
		fi

	    ;;
	    *)
		#       echo "extra-install_paket.sh skipping ${line}"
	    ;;

	    esac

	done < ${paket_liste}

done

echo "Fertig - Extra Paket-Installation für packages.chroot vorbereitet."
