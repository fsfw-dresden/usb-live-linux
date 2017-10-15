#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# Paketlisten nach extra-install Paketen durchsuchen und download nach config/packages.chroot/*
#

FSFW_UNI_STICK_CONFIG=$1
echo "extra-install_paket.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} "

DOWNLOAD="wget -nv -T10 --no-http-keep-alive --show-progress -c"
PAKET_LISTEN=($(ls ./config/package-lists/*))

echo "Extra Paket-Installation für packages.chroot vorbereiten."

# Paketlisten nach "## --extra-installation -->" Paketen durchsuchen

for paket_liste in ${PAKET_LISTEN[@]}
  do
	while read line
	do
	    case "${line%%"  "*}" in
	    "## --extra--installation -->")
		# echo "download = ${line##*-->}"
		paket_quelle=${line##*-->}
		paket=${paket_quelle##*/}

		if [ -n "${paket}" ]; then
			# echo "download = ${paket}"
			if [ -e ../config/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/${paket} ];
			  then
				echo "${paket_quelle##*/} - verfügbar "
			  else
				if [ ! -d ../config/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/ ]; then
				 mkdir -p ../config/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/
				 echo " ../config/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/ erstellt"
				fi
				${DOWNLOAD} ${paket_quelle} -O ../config/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/${paket_quelle##*/}
				echo "${paket_quelle##*/} - geholt "
			fi
		fi

	    ;;
	    *)
		#       echo " Unbekannt "
	    ;;

	    esac

	done < ${paket_liste}

done

echo " extra-install_paket.sh -- system_config  aktuallisieren  "
rsync -avP ../config/${FSFW_UNI_STICK_CONFIG}/system_config/ config
echo " extra-install_paket.sh --system_config  aktuallisiert fertig."


echo "Fertig - Extra Paket-Installation für packages.chroot vorbereiten."
