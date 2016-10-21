#!/bin/bash
#===========================================
#         FILE: fsfw-uni-stick_build.sh
#        USAGE: ./fsfw-uni-stick_build.sh - ( ausführen im live-build-Verzeichnis )
#  DESCRIPTION: erstellen des FSFW-Uni-Stick
#        
#      VERSION: 0.0.1
#      OPTIONS: $1 = DEVICE=/dev/sd... Gerät/USB-Stick der benutzt werden soll
#		     (zu formatierendes Gerät/Device .z.B.: /dev/sdb )
#        NOTES: für - live-build - Debian jessie / Debian stretch - LANG=de_DE.UTF-8
#               
#
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#      CREATED: 2016-10-21
#     REVISION: 
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================

# TODO: Skript Installation auf benötigte Pakete testen

# 	sudo grub2 parted dosfstools gzip syslinux-common wget dialog util-linux pandoc qemu live-build live-config-systemd live-boot

# Dialog welche Aufgaben sollen eredigt werden ? - default alle ?
#	FSFW_UNI_Stick_*.iso bauen
#	Doku bauen und verteilen
#	FSFW user config erstellen	
#	USB-Stick erstellen
#	Windows Programme copieren
#
#

# live-build Umgebung aufräumen

sudo lb clean

# live-build config generieren

sudo lb config

# Paketlisten generieren

sudo ./auto/paketliste

# extra Pakete holen

# TODO:
#script extra-install_paket.sh 	# Paketlisten nach extra-instell Pakenten durchsuchen und download nach config/packages.chroot/*

# Doku bauen und verteilen

# TODO: 
#script doku_create.sh		# ../html/*  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/

# FSFW user config erstellen
# TODO:
#script fsfw-user_config.sh 	# user config aus doc/src_user-config/*  --> config/includes.chroot/home/user/  --> config/includes.chroot/etc/...
# git-versionsnummer / link --> config/includes.chroot/home/user/.version_fsfw-uni-stick
../tools/fsfw-user_config.sh

# live-build config generieren und FSFW_UNI_Stick_*.iso bauen
sudo lb build

# Benutzerberechtigung ändern 
echo "Benutzerberechtigung ändern "
sudo chown ${USER}:${USER} ./FSFW-Uni-Stick*.iso

# TODO:
# USB-Stick erstellen - Speichergerät partitionieren,formatieren - FSFW_UNI_Stick_*.iso schreiben
# script mit $1 starten oder später abfrage ?? 
# sudo ../tools/FSFW_-_USB-Stick_erstellen.sh $1


# TODO:
# Windows Programme downoad & copieren auf WIN-DATEN Partition
# usb-live-linux/doc/src/windows.md	- anpassen [Programm] (download-path-programm.zip *.exe ..*.etc )
#script win-daten_download.sh
#script win-daten_patition_create.sh

