#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# konvertierte Paketlisten nach mit "--extra--installation" markierten
# Paketen durchsuchen und download nach config/packages.chroot/*
#
. "$(dirname "${0}")/functions.sh"
cd_repo_root

echo "Live-Stick ${0}"

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
			mkdir -pv cache/packages.extra config/packages.chroot
			if [ -f cache/packages.extra/${paket} ]; then
				echo "${paket} im cache verfügbar"
			else
				echo "downloade ${paket}"
				${DOWNLOAD} ${paket_quelle} -O cache/packages.extra/${paket}.partial \
					&& echo "${paket} - geholt" \
					|| { echo "Download fehlgeschlagen"; exit 1; }
				TMPDIR=$(mktemp --tmpdir --directory deb-pkg-check-XXX)
				trap "rm -r /tmp/deb-pkg-check-???" EXIT SIGHUP SIGQUIT SIGTERM
				dpkg-deb --extract cache/packages.extra/${paket}.partial ${TMPDIR} \
					|| { echo "${paket} kaputt?"; exit 2; }
				mv -v cache/packages.extra/${paket}{.partial,}
			fi
			cp -a cache/packages.extra/${paket} config/packages.chroot/
		fi

	    ;;
	    *)
		#       echo "extra-install_paket.sh skipping ${line}"
	    ;;

	    esac

	done < ${paket_liste}

done

echo "Fertig - Extra Paket-Installation für packages.chroot vorbereitet."
