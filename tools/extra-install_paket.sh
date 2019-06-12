#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
#	VERSION: 0.0.4
#
#	CREATED: 2016-10-21
#      REVISION: 2019-06-12

#
# Paketlisten nach extra-install Paketen durchsuchen und download nach config/packages.chroot/*
#

echo "extra-install_paket.sh  FSFW-Uni-Stick: variant PATH = ${CONFIG_PATH}  -- variant = ${FSFW_UNI_STICK_CONFIG} "

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
		paket=${paket/-amd64/_amd64}	# korrigiert fehlerhaften Paketnamen - wird sonst nicht installiert)

		if [ -n "${paket}" ]; then
			 echo "download = ${paket}"
			if [ -e ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/${paket} ];
			  then
				echo "${paket} - verfügbar "
			  else
				if [ ! -d ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/ ]; then
				 mkdir -p ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/
				 echo " ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/ erstellt"
				fi
				${DOWNLOAD} ${paket_quelle} -O ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/packages.chroot/${paket}
				echo "${paket} - geholt "
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
rsync -avP ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}/system_config/ config
echo " extra-install_paket.sh --system_config  aktuallisiert fertig."


echo "Fertig - Extra Paket-Installation für packages.chroot vorbereiten."
