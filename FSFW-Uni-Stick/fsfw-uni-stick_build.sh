#!/bin/bash
#===========================================
#         FILE: fsfw-uni-stick_build.sh
#        USAGE: ./fsfw-uni-stick_build.sh - ( ausführen im live-build-Verzeichnis )
#  DESCRIPTION: erstellen des FSFW-Uni-Stick
#        	Nutzung variabler configurationen möglich
#		alle Schritte in diesem Skript können auch einzeln ausgeführt werden 
#
#      VERSION: 0.0.4
#      OPTIONS: TUDO: = DEVICE=/dev/sd... Gerät/USB-Stick der benutzt werden soll
#		     (zu formatierendes Gerät/Device .z.B.: /dev/sdb )
#		$1 TUDO: -c (--config) build-configuration  .z.B.: FSFW-Uni-Stick_KDE_buster_amd64 (default)
#
#        NOTES: für - open-infrastructure-system-* (live-build) - Debian jessie / Debian stretch / Debian buster - LANG=de_DE.UTF-8
#               
#
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#      CREATED: 2016-10-21
#     REVISION: 2019-06-12
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================

# TODO: Skript Installation auf benötigte Pakete testen

# 	sudo grub2 parted dosfstools gzip syslinux-common wget dialog util-linux pandoc qemu open-infrastructure-system-boot open-infrastructure-system-build open-infrastructure-system-config open-infrastructure-system-images

# Dialog welche Aufgaben sollen eredigt werden ? - default alle ?
#
#	FSFW_UNI_Stick_*.iso bauen (CD-Image)
#	Doku bauen und verteilen
#	FSFW user config erstellen	
#	USB-Stick erstellen (komplettes Image mit WIN-DATEN und Persistence Partition)
#	Windows Programme copieren ( auf WIN-DATEN Partition )
#
#
. $(git rev-parse --show-toplevel)/tools/functions.sh

# Der eigentliche Skript-Inhalt liegt innerhalb der folgenden Funktion
# deren Ausgabe kann dann gleichzeitig in ein Dateien und nach stdout geleitet werden
main_function() {

variant_path_set ${@}

# Hinweis bzgl. benötigter superuser-Rechete

if [ "$(id -u)" != "0" ]; then
   echo " "
   echo "Hinweis: Dieses Skript wird derzeit nicht mit root-Rechten ausgeführt."
   echo "Diese werden bei Bedarf (ggf. mehrfach) abgefragt."
   echo " "
   echo " "
   sleep 1
fi

# live-build Umgebung aufräumen
sudo lb clean

# set build config - System Configuration einspielen

variant_config_set
variant_system_config_sync

# Paketlisten generieren
 if [ -e ${VARIANT_PATH}/${BUILD_VARIANT}/paketlisten/default ]; then
	 echo " ../tools/md2package-lists.sh ${VARIANT_PATH}/${BUILD_VARIANT}/paketlisten/$(readlink ${VARIANT_PATH}/${BUILD_VARIANT}/paketlisten/default)  wird ausgeführt "
	 $(repo_root)/tools/md2package-lists.sh ${VARIANT_PATH}/${BUILD_VARIANT}/paketlisten/$(readlink ${VARIANT_PATH}/${BUILD_VARIANT}/paketlisten/default)
	else
	 $(repo_root)/tools/md2package-lists.sh
	 echo " ../tools/md2package-lists.sh wird ausgeführt "
 fi

# extra Pakete holen

# TODO:
#script extra-install_paket.sh 	# Paketlisten nach extra-install Paketen durchsuchen und download nach config/packages.chroot/*
$(repo_root)/tools/extra-install_paket.sh

# Doku bauen und verteilen

# TODO: 
#script doku_create.sh		# ../html/*  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/
$(repo_root)/tools/doku_create.sh

# FSFW user config erstellen
# in multiconfig neue Aufteilung der user configuration  -- alt  ../tools/fsfw-user_config.sh (erstellt nur noch fsfw-user spezifische Teile)

echo " ../tools/fsfw-uni-stick_user-config.sh "${BUILD_VARIANT}"  ausführen "

$(repo_root)/tools/fsfw-uni-stick_user-config.sh

# live-build config generieren -- optionaler Zwischenschritt um config manuell anzupassen - wird sonst von "lb build" mit erledigt 
# sudo lb config
# sudo chown -R ${USER}:${USER} ./config

# live-build config generieren und FSFW_UNI_Stick_*.iso bauen
# sudo lb build

sudo lb config 2>&1 | tee config_build.log
sudo lb bootstrap 2>&1 | tee bootstrap_build.log
sudo lb chroot 2>&1 | tee chroot_build.log
sudo lb binary 2>&1 | tee binary_build.log

# Benutzerberechtigung ändern 
echo "Benutzerberechtigung ändern "
sudo chown ${USER}:${USER} ./*.iso

# Image ins Verzeichnis images verschieben

  if [ ! -d $(repo_root)/images/ ]; then
	 mkdir -p $(repo_root)/images/
	 echo " Verzeichnis images erstellt."
  fi 

mv ./*.iso $(repo_root)/images/

# TODO:
# USB-Stick erstellen - Speichergerät partitionieren,formatieren - FSFW_UNI_Stick_*.iso schreiben
# script mit $1 starten oder später abfrage ?? 
# sudo ../tools/FSFW_-_USB-Stick_erstellen.sh $1


# TODO:
# Windows Programme downoad & copieren auf WIN-DATEN Partition
# usb-live-linux/doc/src/windows.md	- anpassen [Programm] (download-path-programm.zip *.exe ..*.etc )
#script win-daten_download.sh
#script win-daten_copy.sh
#

# TODO:
# Distibution / Verteilung Script
# script Uni_Stick_distri.show
#
# pack USBImage (ZIP)
# make Checksums (PGP, MD5, SHA256, SHA512)
# create Torrent with Webseed
# create Magnet Link


# exportierte Variablen löschen

unset VARIANT_PATH
unset BUILD_VARIANT

}

main_function ${@} 2>&1 | tee fsfw-build-script.log


