#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# konvertierte Paketlisten nach mit "--extra--installation" markierten
# Paketen durchsuchen und download nach config/packages.chroot/*
#
. "$(dirname "${0}")/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 

DOWNLOAD="wget -nv -T10 --no-http-keep-alive --show-progress -c -e content_disposition=off"
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
			 echo "download = ${paket}"
			if [ -s variants/${BUILD_VARIANT}/system-config/packages.chroot/${paket} ];
			  then
				echo "${paket} - verfügbar "
			  else
				if [ ! -d variants/${BUILD_VARIANT}/system-config/packages.chroot/ ]; then
				 mkdir -p variants/${BUILD_VARIANT}/system-config/packages.chroot/
				 echo " variants/${BUILD_VARIANT}/system-config/packages.chroot/ erstellt"
				fi
				${DOWNLOAD} ${paket_quelle} -O variants/${BUILD_VARIANT}/system-config/packages.chroot/${paket}
				echo "${paket} - geholt "
			fi
		fi

	    ;;
	    *)
		#       echo "extra-install_paket.sh skipping ${line}"
	    ;;

	    esac

	done < ${paket_liste}

done

echo " extra-install_paket.sh -- config aktuallisieren.."
rsync -avP variants/${BUILD_VARIANT}/system-config/ config/
echo " extra-install_paket.sh -- config aktuallisiert fertig."


echo "Fertig - Extra Paket-Installation für packages.chroot vorbereitet."
