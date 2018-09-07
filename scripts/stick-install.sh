#!/bin/bash
#===========================================
#         FILE: FSFW_-_USB-Stick_erstellen.sh
#        USAGE: sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sd...  ( Gerät/USB-Stick der benutzt werden soll )
#		- ( ausführen im live-build-Verzeichnis )
#  DESCRIPTION: bringt das live-image.iso (vorzugsweise FSFW-UNI-Stick_${FSFW_UNI_STICK_VERSION}_KDE_stretch-amd64.hybrid.iso) auf einen USB-Stick
#		bootet mit grub2 -
#
#      VERSION: 0.1.1
#      OPTIONS: $1 = DEVICE=/dev/sd... Gerät/USB-Stick der benutzt werden soll
#		     (zu formatierendes Gerät/Device .z.B.: /dev/sdb )
#		$2 = live-image.iso - Default = *.hybrid.iso im aktuellen live-build-Verzeichnis
#        NOTES: Debian jessie - LANG=de_DE.UTF-8
#		Optionen in grub.cfg - submenu - toram - persistence mode
#
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#      CREATED: 2016-09-15
#     REVISION: 2016-11-01 - 2018-08-20
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================
#
# TODO: LANG testen und fals nicht vorhanden auf C (en) stellen -- verschiedene Sprachen unterstützen de, en ....

DEVICE=$1

LABEL_LIVE=FSFW-Uni-Stick
LABEL_WINDOWS_DATEN=WIN-DATEN
LABEL_PERSISTENCE_DATEN=dlp-daten
PERSISTENCE_OPTION="/ union"

LIVE_IMAGE=$2
LIST_LIVE_IMAGES=($(ls ../images/FSFW-Uni-Stick_*_KDE_stretch-amd64.hybrid.iso))
DEFAULT_LIVE_IMAGE=(${LIST_LIVE_IMAGES[${#LIST_LIVE_IMAGES[@]}-1]})	# letztes erstelltes Image
KERNEL_VERSION=
BOOTOPTIONS="components locales=de_DE.UTF-8 keyboard-layouts=de vga=current"
BOOTOPTIONS_RESCUE="components memtest noapic noapm nodma nomce nolapic nomodeset nosmp nosplash vga=normal single"

DATUM=$(date +%Y-%m-%d)

# für mount ein temporäres Verzeichnis erstellen mktemp /mnt/FSFW-Uni-Stick_XXXXXX
TMPDIR=$(mktemp -d /mnt/FSFW-Uni-Stick_XXXXXX)			# rm -IRv $(TMPDIR) -- TMPDIR löschen / aufräumen

DOWNLOAD="wget -nv -T10 --no-http-keep-alive --show-progress -c"

LOG_FILE="FSFW_-_USB-Stick_erstellen_${DATUM}_build.log"

# Variablen für download url's (hdt.iso , memtest.iso  ....)

URL_HDT_ISO=http://github.com/knightmare2600/hdt/blob/master/hdt-0.5.2.iso
URL_MEMTEST_ISO=http://www.memtest.org/download/5.01/memtest86+-5.01.iso	#.gz
URL_SUPERGRUB2_ISO=https://sourceforge.net/projects/supergrub2/files/2.02s9/super_grub2_disk_2.02s9/super_grub2_disk_hybrid_2.02s9.iso

## Variablen - Größen werden im Skript ermittelt
# für neue Partitionen

rel_size_live_system=0
rel_size_windows_daten=0
rel_size_persistence_daten=0

# für existierende Partition


#######################################
# Funktion: Dialog abbrechen überprüfen
#
check_input_abbruch() {
if [[ $? -eq 1 ]]; then
	clear
#	echo " Skript wurde abgebrochen. "
	dialog --stdout --msgbox " Skript wurde abgebrochen. " 5 30
	exit 1
fi
}

##################################
# Funktion: Partitionsgröße Live-System festlegen
#
input_size_live_system() {
rel_size_live_system=$(
dialog --stdout --title "${size_device} MB Gesamtgröße" \
--backtitle "Partitionsgröße Live-System festlegen - Eingabe - Wert in % " \
--inputbox "\n\
	${rel_size_live_system_min}% des Speicherplatzes wird mindestens fürs Live-System benötigt.\n\n\
	Bei Bedarf kann die Größe geändert werden. Eingabewert in % \n\n\
	sollte zwischen ${rel_size_live_system_min} und ${rel_size_live_system_max} liegen.\n " \
0 0 "${rel_size_live_system_default}"
# 12 70
)
check_input_abbruch
}

##################################
# Funktion: Partitionsgröße Windows-Daten festlegen
#
input_size_windows_daten() {
rel_size_windows_daten=$(
dialog --stdout --title "${size_device} MB Gesamtgröße" \
--backtitle "Größe Windows Partition festlegen - Eingabe - Wert in % " \
--inputbox "\n\
	${rel_size_windows_daten_max}% des Speicherplatzes können für Daten-Partitionen genutzt werden.\n\n\
	Bei Bedarf kann die Größe geändert werden. Eingabewert in % \n\n\
	sollte zwischen ${rel_size_windows_daten_min} und ${rel_size_windows_daten_max} liegen.\n\n\
	Größe Windows Partition festlegen: \n " \
0 0 "${rel_size_windows_daten_default}"
# 15 64
)
check_input_abbruch
}

##################################
# Funktion: prüfen ob memdisk vorhanden
#
copy_memdisk() {
if [ ! -f ${TMPDIR}/${LABEL_LIVE}/boot/img/memdisk ]; then cp /usr/lib/syslinux/memdisk ${TMPDIR}/${LABEL_LIVE}/boot/img/memdisk ; fi
}

##################################
# Funktion: Fehler - Skript abbrechen ?
#
input_abbruch() {
	echo "  --  Es ist ein Fehler aufgetreten "
	echo " Möchten sie weiter fortfahren geben sie >> y << ein und die Eingabetaste, Abbruch mit jeder anderen Taste ... : "
	read FEHLER
		if [ ! "$FEHLER" == 'y' ]; then
			echo "Skript wird abgebrochen "
			device_remove
			exit 1
		fi
}


##################################
# Funktion: Speichergerät / USB-Stick freigeben
#
device_remove() {
    echo " Gerät ${DEVICE} wird wieder freigegeben - Bitte warten "
	umount -v ${DEVICE}*
	echo "  ----- Hinweis ----- "
 	echo "löschen mit Taste "y" bestätigen"
	rm -IRv ${TMPDIR}
	echo "Fertig - Speichergerät (USB Stick) kann entfernt werden "
}

##################################
# Funktion: Ermittle, ob Partitionen Präfix p á la /dev/loop0p1 haben
#
device_name_test() {
    echo ":::$DEVICE"
    [[ ${DEVICE} =~ /dev/nbd|/dev/loop ]] && p=p || p=""
}

#################################
# Funktion: Speichergerät einhängen
#
device_mount() {
	echo " Gerät ${DEVICE} wird eingebunden "
	device_name_test

    if [ ! -d ${TMPDIR}/${LABEL_LIVE} ]; then mkdir ${TMPDIR}/${LABEL_LIVE}; fi

	mount ${DEVICE}${p}${live_partition} ${TMPDIR}/${LABEL_LIVE} || input_abbruch

    if [[ $(lsblk -n --output LABEL ${DEVICE} | grep ${LABEL_PERSISTENCE_DATEN} ) = ${LABEL_PERSISTENCE_DATEN} ]]; then
	echo " Persistence Partition wird eingebunden "
	  if [ ! -d ${TMPDIR}/${LABEL_PERSISTENCE_DATEN} ]; then mkdir ${TMPDIR}/${LABEL_PERSISTENCE_DATEN}; fi
	mount ${DEVICE}${p}${persistence_partition} ${TMPDIR}/${LABEL_PERSISTENCE_DATEN} || input_abbruch
    fi
}

#################################
# Funktion: Bootloader installieren
#
grub_install() {
    if [ ! -d ${TMPDIR}/${LABEL_LIVE}/boot/grub ]; then
	echo "grub-install wird ausführt - Bitte warten "
	grub-install --no-floppy --force --removable --root-directory=${TMPDIR}/${LABEL_LIVE} ${DEVICE}
    else
	echo " Grub bereites installiert. "
    fi
}

################################
# Funktion: Bootoader configuration erstellen
#
grub_config_create() { echo "grub.cfg wird erstellt "

cat <<EOF> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg
## grub.cfg - generiert - $(date)

set timeout=15
set default=3

insmod part_msdos
insmod ntfs
insmod ext2
insmod iso9660
insmod font

function load_video {
  if [ x$feature_all_video_module = xy ]; then
    insmod all_video
  else
#    insmod efi_gop
#    insmod efi_uga
#    insmod ieee1275_fb
    insmod vbe
    insmod vga
    insmod video_bochs
    insmod video_cirrus
  fi
}

 if loadfont \${prefix}/fonts/unicode.pf2
    then
       set gfxmode=auto
       load_video
       insmod gfxterm
       set locale_dir=\${prefix}/locale
       set lang=de_DE
       insmod gettext
       set gfxpayload=keep
       terminal_output gfxterm
 fi

insmod png
if background_image \${prefix}/fsfw-background_640x480.png; then
  set color_normal=white/black
  set color_highlight=black/white
else
  set menu_color_normal=cyan/blue
  set menu_color_highlight=white/blue
fi

EOF
}

################################
# Funktion: Bootoader - Zusatzmenü anhängen
#
grub_config_append_zusatz_menu() { echo "grub.cfg ergänzen "

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

## sonstige Menüeinträge

menuentry " " { echo
}

menuentry "Booten von HDD - Rechner von Festplatte starten " {
 set root=(hd1)
 chainloader +1
}

menuentry "____________________________ Neustart _________________________________" { echo
}

menuentry "Restart - Rechner neu Starten " {
 reboot
}
menuentry "Shut Down - Rechner ausschalten " {
 halt
}

EOF
}

#######################################
# Toolbox einfügen
#
grub_config_insert_toolbox() { echo " Toolbox einfügen "

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

submenu "--- Toolbox --- " {

EOF

    for xtool in ${tool}; do
#	echo " Toolbox "
	case "${xtool}" in

	memtest86+)
		echo " ${xtool} einfügen "
		tool_iso=/boot/boot-isos/${URL_MEMTEST_ISO##*/}
cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry "Memory test (memtest86+) iso " {
     linux16 /boot/img/memdisk iso
     initrd16 ${tool_iso}
}

EOF
		copy_memdisk
		if [ ! -e ${TMPDIR}/${LABEL_LIVE}${tool_iso} ]; then
		${DOWNLOAD} ${URL_MEMTEST_ISO}.gz -O ${TMPDIR}/${LABEL_LIVE}${tool_iso}.gz || input_abbruch
		gzip -d  ${TMPDIR}/${LABEL_LIVE}${tool_iso}.gz || input_abbruch
		fi
		;;
	hdt)
		echo " ${xtool} einfügen "
		tool_iso=/boot/boot-isos/${URL_HDT_ISO##*/}
cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry "Hardware Test (HDT) " {
     linux16 /boot/img/memdisk iso
     initrd16 ${tool_iso}
}
EOF
		copy_memdisk
		if [ ! -e ${TMPDIR}/${LABEL_LIVE}${tool_iso} ]; then
		${DOWNLOAD} ${URL_HDT_ISO}?raw=true -O ${TMPDIR}/${LABEL_LIVE}${tool_iso} || input_abbruch
		fi
	    ;;
	super-grub2-disk)
		echo " ${xtool} einfügen "
		tool_iso=/boot/boot-isos/${URL_SUPERGRUB2_ISO##*/}

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry "Super Grub2 Disk " {
    echo -e " \n \n \n  Bitte einen kleinen Moment Geduld "
    loopback loop ${tool_iso}
    root=(loop)
    configfile /boot/grub/loopback.cfg
}

EOF
		copy_memdisk
		if [ ! -e ${TMPDIR}/${LABEL_LIVE}${tool_iso} ]; then
		${DOWNLOAD} ${URL_SUPERGRUB2_ISO} -O ${TMPDIR}/${LABEL_LIVE}${tool_iso} || input_abbruch
		fi
	    ;;

	    *)
		echo " ENDE Toolbox "
	    ;;
    esac
  done

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry "lspci - Hardware Infos " {
lspci
read
}

menuentry "VbeInfo" {
vbeinfo
read
}

EOF

# submenu Toolbox schließen
cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg
}
EOF


}

#######################################
# Funktion: Live-Image einfügen
#
grub_config_insert_live_image() {
		echo " ${LIVE_IMAGE##*/} Live-System-Image einfügen "
		iso_time=($(ls --full-time ${LIVE_IMAGE}))
		system_iso=/boot/boot-isos/${iso_time[5]}_${LIVE_IMAGE##*/}
		# menu_label = {LIVE_IMAGE} ohne PATH - .hybrid.iso entfernen - Leerzeichen entfernen
		menu_label=${LIVE_IMAGE##*/} && menu_label=${menu_label%%.*} && menu_label=${menu_label//_/ }

# Persistence Partition Menüeintrag und persistence.conf anlegen
if [[ $(lsblk -n --output LABEL ${DEVICE} | grep ${LABEL_PERSISTENCE_DATEN} ) = ${LABEL_PERSISTENCE_DATEN} ]]; then
	echo " Persistence option in grub.cfg einfügen "
	echo ${PERSISTENCE_OPTION} > ${TMPDIR}/${LABEL_PERSISTENCE_DATEN}/persistence.conf

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry " ____________________ Live System + Persistence Mode ____________________ " { echo
}

menuentry " Geänderte Daten werden auf die Partition dlp-daten geschrieben und bleiben erhalten. " { echo
}
menuentry " " { echo
}

menuentry "${menu_label} - Live System - persistence " {
    echo -e " \n \n \n Bitte einen kleinen Moment Geduld "
    insmod ext2
    insmod part_msdos
    set isofile=${system_iso}
    loopback loop \$isofile
    linux (loop)/live/vmlinuz${KERNEL_VERSION} boot=live findiso=\$isofile ${BOOTOPTIONS} persistence persistence-label=${LABEL_PERSISTENCE_DATEN}
    initrd (loop)/live/initrd.img${KERNEL_VERSION}
}

EOF

fi

cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg
menuentry " " { echo
}

menuentry " _____________________________ Live System _____________________________ " { echo
}
menuentry " " { echo
}

menuentry "${menu_label} - Live System " {
    echo -e " \n \n \n  Bitte einen kleinen Moment Geduld "
    insmod ext2
    insmod part_msdos
    set isofile=${system_iso}
    loopback loop \$isofile
    linux (loop)/live/vmlinuz${KERNEL_VERSION} boot=live findiso=\$isofile ${BOOTOPTIONS}
    initrd (loop)/live/initrd.img${KERNEL_VERSION}
}

EOF


cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg

menuentry " " { echo
}

submenu "--- Optionen --- " {

menuentry " ___________________________ toram ___________________________  " { echo
}
menuentry " System wird komplett in den Arbeitsspeicher geladen " { echo
}
menuentry " " { echo
}

menuentry "${menu_label} - Live System - toram " {
    echo -e " \n \n \n  Bitte einen kleinen Moment Geduld "
    insmod ext2
    insmod part_msdos
    set isofile=${system_iso}
    loopback loop \$isofile
    linux (loop)/live/vmlinuz${KERNEL_VERSION} boot=live findiso=\$isofile ${BOOTOPTIONS} toram
    initrd (loop)/live/initrd.img${KERNEL_VERSION}
}

menuentry " " { echo
}

menuentry " _____________________ Live System - rescue mode ____________________ " { echo
}

menuentry "${menu_label} - Live System (rescue mode) " {
    echo -e " \n \n \n  Bitte einen kleinen Moment Geduld "
    insmod ext2
    insmod part_msdos
    set isofile=${system_iso}
    loopback loop \$isofile
    linux (loop)/live/vmlinuz${KERNEL_VERSION} boot=live findiso=\$isofile ${BOOTOPTIONS_RESCUE}
    initrd (loop)/live/initrd.img${KERNEL_VERSION}
}

EOF


# submenu Option Ende
cat <<EOF>> ${TMPDIR}/${LABEL_LIVE}/boot/grub/grub.cfg
}
EOF

	copy_memdisk
	if [[ ! -e ${TMPDIR}/${LABEL_LIVE}${system_iso} ]]; then
		echo " ${LIVE_IMAGE} -- kopieren --> ${system_iso}"
		cp ${LIVE_IMAGE} ${TMPDIR}/${LABEL_LIVE}${system_iso} || input_abbruch
	else
		echo " ${system_iso} ist vorhanden "
	fi

}

# ======= Stick erstellen - formatieren ==========
######################################
# Funktion: Speichergerät Partitionen configurieren
#
input_partition_layout() {
	# Part-größe $(( Live-Image-Größe * 100 / Stick-Größe )) ## in %
	# echo $(( ${size_live_system_min} * 100 / ${size_device} ))

# Soll eine WINDOS-Partition (vfat) angelegt werden ? - Welche Größe MB oder % von USB-Stick-Größe

dialog --stdout --yesno "Soll eine Partition für Windows-Daten angelegt werden ?" 6 60
# Ja = 0 -- Nein = 1
p_windows_daten=$?
dialog --clear

# Soll eine Partition für Persistence-Mode angelegt werden ? Größe ?

dialog --stdout --yesno \
"Soll eine Partition für Persistence-Mode angelegt werden ?\n\n\n\
(Persistence-Mode -- Im Live-System geänderte Daten werden auf dieser Partition abgelegt und bleiben somit erhalten.) " 10 62
# Ja = 0 -- Nein = 1
p_persistence_daten=$?

# dialog --stdout --msgbox "Partition Windows = ${p_windows_daten}" 5 30
# dialog --stdout --msgbox "Partition Persistence = ${p_persistence_daten}" 5 30

# ==== Patitionsgröße Live-Image festlegen ======

#   Persistence Partition und Windows Daten Partition ja

if [[ $(( ${p_windows_daten} + ${p_persistence_daten} )) -eq 0 ]]; then
	# dialog --stdout --msgbox "Partition Windows + Partition Persistence" 0 0
	#   empfohlene Live-System Partitionsgröße
	#   möglichtst nicht größer 50% des (gesamter Speicher)

	# rel_size_live_system_min = (Speicher den das Live-System benötigt) in %
	rel_size_live_system_min=$(( ${size_live_system_min} * 100 / ${size_device} ))
	# rel_size_live_system_max 50% des (gesamter Speicher)
	rel_size_live_system_max=50
	# rel_size_live_system_min > rel_size_live_system_max
	# --> rel_size_live_system_max = rel_size_live_system_min
	if [[ ${rel_size_live_system_min} -gt ${rel_size_live_system_max} ]]; then
		rel_size_live_system_max=${rel_size_live_system_min}
	fi
	#   empfohlene Live-System Partitionsgröße = (Speicher Live-System + 20%)
	rel_size_live_system_default=$(( ${rel_size_live_system_min} * 12 / 10 ))

	# (gesamter Speicher) < (empfohlener Speicher Live-System)
	# --> (empfohlener Speicher Live-System) = (Speicher den das Live-System benötigt) in %
	if [[ ${size_device} -lt ${rel_size_live_system_default} ]]; then
		rel_size_live_system_default=${rel_size_live_system_min}
	fi
	# empfohlene Live-System Partitionsgröße > rel_size_live_system_max
	# rel_size_live_system_max = empfohlene Live-System Partitionsgröße
	if [[ ${rel_size_live_system_default} -gt ${rel_size_live_system_max} ]]; then
		rel_size_live_system_max=${rel_size_live_system_default}
	fi
fi

#   Persistence Partition oder Windows Daten Partition ja

if [[ $(( ${p_windows_daten} + ${p_persistence_daten} )) -eq 1 ]]; then
	# dialog --stdout --msgbox "Partition Windows oder Partition Persistence" 0 0
	#   empfohlene Live-System Partitionsgröße = 50% vom gesamten Speicher mindestens (Speicher Live-System)

	# rel_size_live_system_min = (Speicher den das Live-System benötigt)
	rel_size_live_system_min=$(( ${size_live_system_min} * 100 / ${size_device} ))
	# rel_size_live_system_max 70% des (gesamter Speicher)
	rel_size_live_system_max=70
	# rel_size_live_system_min > rel_size_live_system_max
	# --> rel_size_live_system_max = rel_size_live_system_min
	if [[ "${rel_size_live_system_min}" -gt "${rel_size_live_system_max}" ]]; then
		rel_size_live_system_max=${rel_size_live_system_min}
	fi
	#   empfohlene Live-System Partitionsgröße = (Speicher Live-System + 20%)
	rel_size_live_system_default=$(( ${rel_size_live_system_min} * 12 / 10 ))
	if [[ "${rel_size_live_system_default}" -lt "50" ]]; then
		rel_size_live_system_default=50
	fi
	# (gesamter Speicher) < (empfohlener Speicher Live-System)
	# --> (empfohlener Speicher Live-System) = (Speicher den das Live-System benötigt) in %
	if [[ "${size_device}" -lt "${rel_size_live_system_default}" ]]; then
		rel_size_live_system_default=${rel_size_live_system_min}
#		rel_size_live_system_default=$(( $(( ${size_live_image%%M *} + 32 )) * 100 / ${size_device} ))
	fi
fi

#   Persistence Partition und Windows Daten Partition nein

if [[ $(( ${p_windows_daten} + ${p_persistence_daten} )) -eq 2 ]]; then
	# dialog --stdout --msgbox "keine Partition" 0 0

	# rel_size_live_system_min = (Speicher den das Live-System benötigt) in %
	rel_size_live_system_min=$(( ${size_live_system_min} * 100 / ${size_device} ))
	# rel_size_live_system_max 100% des (gesamter Speicher)
	rel_size_live_system_max=100
	#   empfohlene Live-System Partitionsgröße = gesamten Speicher (100%)
	rel_size_live_system_default=100
fi

# überprüfen rel_size_live_system < Speicher den das Live-System benötigt
# überprüfen rel_size_live_system > 100 %
while [[ ${rel_size_live_system} -lt ${rel_size_live_system_min} ]] || [[ ${rel_size_live_system} -gt 100 ]]
do
	input_size_live_system
done


# ==== Patitionsgröße Windos Daten festlegen ======

if [[ $(( ${p_windows_daten} + ${p_persistence_daten} )) -eq 0 ]]; then
	# dialog --stdout --msgbox "Partition Windows + Partition Persistence" 0 0
	#   empfohlene Windows Daten Partitionsgröße
	#   möglichtst nicht größer 50% des (gesamter Speicher)

	# rel_size_windows_daten_min = 0  -- 5% sollten es schon sein, damit es Sinn ergibt
	rel_size_windows_daten_min=5
	# rel_size_windows_daten_max = noch nicht belegten (gesamter Speicher)
	rel_size_windows_daten_max=$(( 100 - ${rel_size_live_system} ))

	# sollte rel_size_windows_daten_min > rel_size_windows_daten_max sein
	# --> rel_size_windows_daten_min = rel_size_windows_daten_max
	if [[ ${rel_size_windows_daten_min} -gt ${rel_size_windows_daten_max} ]]; then
		rel_size_windows_daten_min=${rel_size_windows_daten_max}
	fi

	#  empfohlene Windows Daten Partitionsgröße = 50% vom noch nicht belegten (gesamte Speicher)
	rel_size_windows_daten_default=$(( ${rel_size_windows_daten_max} / 2 ))

	# (empfohlene Windows Daten Partitionsgröße) < (rel_size_windows_daten_min)
	# --> (empfohlene Windows Daten Partitionsgröße) = (rel_size_windows_daten_min) in %
	if [[ ${rel_size_windows_daten_default} -lt ${rel_size_windows_daten_min} ]]; then
		rel_size_windows_daten_default=${rel_size_windows_daten_min}
	fi
fi

#   Persistence Partition oder Windows Daten Partition ja

if [[ $(( ${p_windows_daten} + ${p_persistence_daten} )) -eq 1 ]]; then
	# dialog --stdout --msgbox "Partition Windows oder Partition Persistence" 0 0
	#   empfohlene Partitionsgröße

	# rel_size_windows_daten_min = 0  -- 5% sollten es schon sein, damit es Sinn ergibt
	rel_size_windows_daten_min=5
	# rel_size_windows_daten_max = noch nicht belegten (gesamter Speicher)
	rel_size_windows_daten_max=$(( 100 - ${rel_size_live_system} ))

	# sollte rel_size_windows_daten_min > rel_size_windows_daten_max sein
	# --> rel_size_windows_daten_min = rel_size_windows_daten_max
	if [[ "${rel_size_windows_daten_min}" -gt "${rel_size_windows_daten_max}" ]]; then
		rel_size_windows_daten_min=${rel_size_windows_daten_max}
	fi
	#  empfohlene Windows Daten Partitionsgröße = Rest vom noch verfügbaren Speicher
	rel_size_windows_daten_default=${rel_size_windows_daten_max}

	# (empfohlene Windows Daten Partitionsgröße) < (rel_size_windows_daten_min)
	# --> (empfohlene Windows Daten Partitionsgröße) = (rel_size_windows_daten_min) in %
	if [[ "${rel_size_windows_daten_default}" -lt "${rel_size_windows_daten_min}" ]]; then
		rel_size_windows_daten_default=${rel_size_windows_daten_min}
	fi
fi


# überprüfen rel_size_windows_daten <= Rest vom noch verfügbaren Speicher
# überprüfen rel_size_windows_daten => 0 %

if [[ ${p_windows_daten} -eq 0 ]]; then
	# dialog --stdout --msgbox "Partition Windows Daten - größe festlegen" 0 0
	if [[ $(( 100 - ${rel_size_live_system} )) -gt 5 ]]; then
		while [[ ${rel_size_windows_daten} -lt 5 ]] || [[ ${rel_size_windows_daten} -gt ${rel_size_windows_daten_max} ]]
		do
			input_size_windows_daten
		done
	else
		dialog --stdout --msgbox " Für eine Windows Daten Partition\n\n ist nicht mehr genügend Speicher verfügbar "  8 48
	fi
fi

# Größe Persistence Daten Partition = Rest vom noch verfügbaren Speicher
# Größe Persistence Daten Partition = 100-(Speicher Live-System)-(Speicher Windows Daten Partition)

if [[ ${p_persistence_daten} -eq 0 ]]; then
	# dialog --stdout --msgbox "Partition Persistence Daten - größe festlegen" 0 0
	if [[ $(( 100 - ${rel_size_live_system} - ${rel_size_windows_daten} )) -gt 0 ]]; then

		rel_size_persistence_daten=$(( 100 - ${rel_size_live_system} - ${rel_size_windows_daten} ))
		dialog --title "${size_device} MB Gesamtgröße" \
		--backtitle "Größe Persistence Partition" \
		--msgbox "\n Größe der Patition für Persistence Daten beträgt $(( ${rel_size_persistence_daten} * ${size_device} / 100)) MB.\n\n " 8 64
	else
		dialog --stdout --msgbox " Für eine Persistence Daten Partition\n\n ist nicht mehr genügend Speicher verfügbar "  8 48
	fi
fi

: << Kommentar
# Werte für die Partitionsgrößen

dialog --stdout --msgbox "Partition Live-System = ${rel_size_live_system}\n\n\
Partition Windows Daten = ${rel_size_windows_daten}\n\n\
Partition Persistence = ${rel_size_persistence_daten}\n " 0 0

dialog --stdout --msgbox "Partition Live-System = $(( ${rel_size_live_system} * ${size_device} / 100)) MB.\n\n\
Partition Windows Daten = $(( ${rel_size_windows_daten} * ${size_device} / 100)) MB.\n\n\
Partition Persistence = $(( ${rel_size_persistence_daten} * ${size_device} / 100)) MB.\n " 0 0
Kommentar

}

# ====== Beginn ===========================

main() {
echo " \$0 = ${0}"
echo " \$@ = ${@}"

echo " DEFAULT_LIVE_IMAGE = ${DEFAULT_LIVE_IMAGE} "

# System auf benötigte Software / Pakete prüfen

echo "System prüft - sind alle benötigten Software-pakete vorhanden."
    for paket in "sudo" "grub2" "parted" "dosfstools" "gzip" "syslinux-common" "wget" "dialog" "util-linux" # "Test-Paket"
	do
#		echo " ${paket} überprüfen "
		dpkg -l | grep -q ${paket}
		if [[ $? -eq 1 ]]; then
			echo "Das Paket >> $paket << ist nicht installiert"
			echo "Instalieren sie es mit"
			echo "		sudo apt-get install $paket "
			exit 1
		fi
    done

# ${DEVICE} vorhanden ?
if [ -z "$1" ]; then
	echo "  Skript wird abgebrochen. Es ist kein Ziel (Speichergerät) vorhanden "
	echo "  Bitte ein Speichergerät angeben (z.B sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdb ) "
	exit 1
fi

# ${LIVE_IMAGE} vorhanden ?
if [ -z "${LIVE_IMAGE}" ]; then
	if [ -e ${DEFAULT_LIVE_IMAGE} ]; then
			# echo "${DEFAULT_LIVE_IMAGE} ist vorhanden"
			LIVE_IMAGE=${DEFAULT_LIVE_IMAGE}
		else
			echo "  Skript wird abgebrochen. Es ist wurde kein Live-Image gefunden "
			echo "  Live-Image erstellen oder angeben."
			echo "  (z.B sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdb live-image.iso ) "
			exit 1
	fi
fi

echo "  Das Live-Image >> ${LIVE_IMAGE##*/} << wird verwendet "

echo "System erfolgreich überprüft."


# Größe des Sticks feststellen - Größe Ausgeben

unset size_device
size_device=($(lsblk -b -n --output SIZE ${DEVICE}))
size_device=$(( ${size_device[0]} / 1024 / 1024))

# echo "  ${size_device} werden vom verwendet Speichergerät >> ${DEVICE} << bereitgestellt "
dialog --title "Gesamtgröße verfügbarer Speicher" \
--backtitle "Speicher der zur Verfügung steht " \
--msgbox "\n\
		${size_device} MB werden vom verwendet Speichergerät\n\n\
			>> ${DEVICE} <<  bereitgestellt\n " 0 0

# Größe des Live-Images feststellen	Fehler falls USB-Stick zu klein
# Partition für Live-Image - mindestens Größe = live-image + grub2 + memdisk + tools
# grub2 + memdisk 	ca. 15 MB
# tools			ca. 25 MB

size_live_image=$(ls --dereference --size --block-size=M ${LIVE_IMAGE})
size_live_image_min=$((${size_live_image%%M *}+40))
# echo "  $(size_live_image_min)MB werden mindestens für das Live-Images >> ${LIVE_IMAGE##*/} << und Tools benötigt "

dialog --title "Speicher den das Live-System benötigt" \
--backtitle "Speicher Live-System" \
--msgbox "\n\
		${size_live_system_min} MB werden mindestens für das Live-Image\n\n\
			>> ${LIVE_IMAGE##*/} << \n\n\
		und Tools benötigt\n " 0 0

if [[ "${size_device}" -lt "${size_live_system_min}" ]]; then
#	echo "  Das Speichergerät hat nicht genügend Kapazität um das System zu erstellende "
#	echo "  Skript wird abgebrochen."
	dialog --stdout --msgbox "\nDas Speichergerät hat nicht genügend Kapazität um das System zu erstellende. Das Skript wird abgebrochen. \n " 8 60
	exit 1
fi

# Tools auswählen
tool=$(dialog \
	--stdout --backtitle "Toolbox - System-Auswahl"  \
	--title " Tool - Auswahl " \
	--checklist "\n Welche Tools sollen mit auf den Datenträger ?.\n " 13 65 5 \
    "memtest86+" 		" Tool für Speichertest  	- 1,8 MB " on \
    "hdt" 			" Hardware Test (HDT)    	- 1,3 MB " on \
    "super-grub2-disk" 		" Toolbox 			-  20 MB " on \
    )

# USB-Stick formatieren	-
# Soll der USB-Stick neu formatiert werden ?

dialog --stdout --defaultno --title "${size_device} MB Gesamtgröße" \
		--backtitle "${DEVICE} wird neu formatiert" \
		--yesno "\n ${DEVICE} neu formatieren ? \n " 0 0

if [[ $? -eq 0 ]]; then

	dialog --stdout --defaultno --title "${size_device} MB Gesamtgröße" \
		--backtitle "${DEVICE} wird neu formatiert" \
		--yesno "\n\
		Das Gerät >> ${DEVICE} << soll neu formatiert werden. \n\n\
		            ALLE DATEN GEHEN VERLOREN ! \n\n " 0 0

	  if [[ $? -eq 0 ]]; then
		input_partition_layout

		dialog --stdout --title "${size_device} MB Gesamtgröße" \
			--backtitle "${DEVICE} wird neu formatiert" \
			--yesno "\n\
		Partition Live-System = $(( ${rel_size_live_system} * ${size_device} / 100)) MB. \n\n\
		Partition Windows Daten = $(( ${rel_size_windows_daten} * ${size_device} / 100)) MB. \n\n\
		Partition Persistence = $(( ${rel_size_persistence_daten} * ${size_device} / 100)) MB. \n " 0 0

		if [[ $? -eq 0 ]]; then
		device_name_test
		partition=1
		parted -s ${DEVICE} mklabel msdos
			# Windows Daten Partition anlegen
			if [[ ${p_windows_daten} -eq 0 ]] && [[ ${rel_size_windows_daten} -gt 0 ]]; then
			parted -s --align=opt ${DEVICE} mkpart primary fat32 0% ${rel_size_windows_daten}%
			parted -s ${DEVICE} align-check optimal ${partition}
			mkfs.vfat -F32 -n ${LABEL_WINDOWS_DATEN} ${DEVICE}${p}${partition}
			echo " Windos Daten Partition ${partition} - ${LABEL_WINDOWS_DATEN} angelegt "
			partition=$(( ${partition} + 1 ))
			fi
		# Live-System Partition anlegen
		live_partition=${partition}
		parted -s --align=opt ${DEVICE} mkpart primary ext2 $(( 0 + ${rel_size_windows_daten} ))% $(( ${rel_size_windows_daten} + ${rel_size_live_system} ))%
		parted -s ${DEVICE} set ${partition} boot on
		parted -s ${DEVICE} align-check optimal ${partition}
		mkfs.ext2 -m 0 -L ${LABEL_LIVE} ${DEVICE}${p}${partition}
			echo " Live Image Partition ${partition} - ${LABEL_LIVE} angelegt "
		partition=$(( ${partition} + 1 ))
			# Persistence Daten Partition anlegen
			if [[ ${p_persistence_daten} -eq 0 ]] && [[ ${rel_size_persistence_daten} -gt 0 ]]; then
			persistence_partition=${partition}
			parted -s --align=opt ${DEVICE} mkpart primary ext4 $(( 0 + ${rel_size_windows_daten} + ${rel_size_live_system} ))% 100%
			parted -s ${DEVICE} align-check optimal ${partition}
			mkfs.ext4 -m 0 -L ${LABEL_PERSISTENCE_DATEN} ${DEVICE}${p}${partition}
			echo " Persistence Partition ${partition} - ${LABEL_PERSISTENCE_DATEN} angelegt "
			fi
		  else
			check_input_abbruch
		fi
	  else
		check_input_abbruch
	  fi


	else
	 dialog --stderr --msgbox "\n Weiter ohne neu zu formatieren. \n " 0 0
	 part_labels=$(lsblk -n --output LABEL ${DEVICE} )
		partition=0
	 for label in ${part_labels}; do
		partition=$(( ${partition} + 1 ))
		case "${label}" in
		${LABEL_LIVE})
			echo " ${label} Patition ${partition} vorhanden "
			live_partition=${partition}
			echo
		  ;;
		${LABEL_WINDOWS_DATEN})
			echo " ${label} Patition ${partition} vorhanden "
			echo
		  ;;
		${LABEL_PERSISTENCE_DATEN})
			echo " ${label} Patition ${partition} vorhanden "
			persistence_partition=${partition}
			echo
		  ;;

		*)
			echo " Patition - ${label} - kann nicht benutzt werden "
			input_abbruch
		  ;;

		esac

	 done
#		echo " ${live_partition} Partition wird für das Live-System verwendet. "

	  if [[ -z ${live_partition} ]]; then
		echo " Es gibt keine Partition die für das Live-System nutzbar ist. "
		echo " Das Speichergerät sollt neu formatiert werden. "
		exit 1
	     else
		echo " ${live_partition} Partition wird für das Live-System verwendet. "
	  fi

	  if [[ -z ${persistence_partition} ]]; then
		echo " Es gibt keine Persistence Partition die nutzbar ist. "
		echo " Das Speichergerät sollte neu formatiert werden. "
		input_abbruch
	     else
		echo " ${persistence_partition} Partition wird für Persistence Partition verwendet. "
	  fi
fi

echo " Gerät ist aktuell so partitioniert "
parted -s ${DEVICE} print

device_mount

grub_install

echo " Datein / Verzeichnise anlegen"

if [ ! -d ${TMPDIR}/${LABEL_LIVE}/boot/boot-isos ]; then mkdir ${TMPDIR}/${LABEL_LIVE}/boot/boot-isos; echo "${TMPDIR}/${LABEL_LIVE}/boot/boot-isos angelegt "; fi
if [ ! -d ${TMPDIR}/${LABEL_LIVE}/boot/img ]; then mkdir ${TMPDIR}/${LABEL_LIVE}/boot/img; echo "${TMPDIR}/${LABEL_LIVE}/boot/img angelegt "; fi

if [[ ! -e ${TMPDIR}/${LABEL_LIVE}/boot/grub/fsfw-background_640x480.png ]] ; then
 cp ../doc/default_config/system_config/bootloaders/grub-pc/fsfw-background_640x480.png ${TMPDIR}/${LABEL_LIVE}/boot/grub/fsfw-background_640x480.png
#${DOWNLOAD} https://wiki.fsfw-dresden.de/lib/exe/fetch.php/playground/beispiele/media/bilder/fsfw-background_640x480.png -O ${TMPDIR}/${LABEL_LIVE}/boot/grub/fsfw-background_640x480.png
fi || input_abbruch

grub_config_create

grub_config_insert_live_image

grub_config_insert_toolbox

grub_config_append_zusatz_menu

device_remove

}

# ====== Ende ===============
#
main "${@}" | tee ${LOG_FILE}

