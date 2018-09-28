#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# konvertierte Paketlisten nach mit "--extra--installation" markierten
# Paketen durchsuchen und download nach config/packages.chroot/*
#
. "$(dirname "${0}")/functions.sh"
cd_repo_root

FSFW_UNI_STICK_CONFIG=$1
echo "extra-install_paket.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} "

DOWNLOAD="wget -nv -T10 --no-http-keep-alive --show-progress -c"
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
			if [ -s variants/${FSFW_UNI_STICK_CONFIG}/config/packages.chroot/${paket} ];
			  then
				echo "${paket} - verfügbar "
			  else
				if [ ! -d variants/${FSFW_UNI_STICK_CONFIG}/config/packages.chroot/ ]; then
				 mkdir -p variants/${FSFW_UNI_STICK_CONFIG}/config/packages.chroot/
				 echo " variants/${FSFW_UNI_STICK_CONFIG}/config/packages.chroot/ erstellt"
				fi
				${DOWNLOAD} ${paket_quelle} -O variants/${FSFW_UNI_STICK_CONFIG}/config/packages.chroot/${paket}
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
rsync -avP variants/${FSFW_UNI_STICK_CONFIG}/config/ config/
echo " extra-install_paket.sh -- config aktuallisiert fertig."


echo "Fertig - Extra Paket-Installation für packages.chroot vorbereitet."
