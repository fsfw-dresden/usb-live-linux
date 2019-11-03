#!/bin/bash
# ad-hoc live stick installation script
# BETA status
# Kein Backup
# KEIN MITLEID

. "`dirname "${0}"`/functions.sh"
cd_repo_root

PAUSE=0
if [ $PAUSE -eq 1 ]
then
        debug_pause() {
            echo
            read -n1 -p "Press [q] to quit, [any other] key to proceed.."
            [ "$REPLY" = "q" ] && exit 0
        }
else
        debug_pause() { echo; }
fi

select_target_device() {
    OPTIONS=()
    for DEVICE in /dev/{sd?,vd?,loop*}
    do
        DEVNAME=${DEVICE#/dev/}
        [ -e /sys/block/${DEVNAME}/size ] || continue
        SIZE=$(($(< /sys/block/${DEVNAME}/size) * 512))
        SIZESTR=$(numfmt --to=iec-i --suffix B ${SIZE})
        NUMPARTITIONS=$(grep -c "${DEVNAME}[[:alnum:]]\+$" /proc/partitions)
        [ ${SIZE} -eq 0 ] && continue
        BACKING=/sys/block/${DEVNAME}/loop/backing_file
        [ -e ${BACKING} ] && BACKING="$(<${BACKING}) " || BACKING=""
        grep -qs 1 /sys/block/${DEVNAME}/removable || [[ -d /sys/block/${DEVNAME}/loop ]] && \
            OPTIONS+=(${DEVICE} "${SIZESTR} ${BACKING}(${NUMPARTITIONS} $(ngettext 'partition' 'partitions' ${NUMPARTITIONS}))")
    done
    TEXT="Please choose the target device for installation of the live system.\n(Only removable block and loop devices with non-zero size are listed)"
    HEIGHT=25
    WIDTH=120
    MENUHEIGHT=20
    DIALOGRC=<(echo -e "tag_key_color = tag_color\ntag_key_selected_color = tag_selected_color") dialog --stdout --title "SELECT LIVE SYSTEM TARGET DEVICE" --menu "${TEXT}" ${HEIGHT} ${WIDTH} ${MENUHEIGHT} "${OPTIONS[@]}"
}

select_live_iso() {
    OPTIONS=()
    for ISO in $(command ls -Lt iso-images/*.iso)
    do
        SIZESTR=$(numfmt --to=iec-i --suffix B $(stat --dereference --format='%s' "${ISO}"))
        OPTIONS+=(${ISO} "${SIZESTR} $(date --date=@$(stat --dereference --format='%Y' "${ISO}") "+%F %_H:%M:%S")")
    done
    TEXT="Please choose the live system to be installed on ${DEVICE}"
    HEIGHT=25
    WIDTH=120
    MENUHEIGHT=20
    DIALOGRC=<(echo -e "tag_key_color = tag_color\ntag_key_selected_color = tag_selected_color") dialog --stdout --title "SELECT LIVE SYSTEM ISO" --menu "${TEXT}" ${HEIGHT} ${WIDTH} ${MENUHEIGHT} "${OPTIONS[@]}"
}

# target DEVICE can be given as first parameter or interactively selected
[ -b "$1" ] && DEVICE=$1 || DEVICE=$(select_target_device)
#clear -x
echo "DEVICE=${DEVICE}"

# no device no play
[ -z ${DEVICE} ] && echo "no DEVICE chosen, cannot continue" >&2 && exit 2

# COLOR_RED=""
# proceed only if selected device is not mounted
grep -s "^${DEVICE}" /proc/mounts && echo "partition(s) on $(color bold red)${DEVICE} currently mounted$(color off), not continuing!" >&2 && exit 1

# loop devices have a different naming scheme (loop3p1 vs sdc1)
[[ "$DEVICE" =~ "loop" ]] && p="p" || p=""

# the LIVE_IMAGE iso file can be given as second parameter or interactively selected
[ -e "$2" ] && LIVE_IMAGE=$2 || LIVE_IMAGE=$(select_live_iso)
#clear -x
echo "LIVE_IMAGE=${LIVE_IMAGE}"

# no device no play
[ -z ${LIVE_IMAGE} ] && echo "no LIVE_IMAGE chosen, cannot continue" >&2 && exit 3

# any partitions on the device? => show the layout
[ $(grep -c "${DEVICE#/dev/}[[:alnum:]]\+$" /proc/partitions) -gt 0 ] && parted --script ${DEVICE} print free
debug_pause

# --script ?
#set -x

# ad-hoc calculation of partition sizes
mb_size_stick=16000
mb_size_space_buffer=750

mb_size_partition_fat32=4000
rel_size_partition_fat32=$((100 * mb_size_partition_fat32/mb_size_stick))

size_live_system=$(ls --dereference --size --block-size=M ${LIVE_IMAGE})
size_live_system=${size_live_system%%M *}
mb_size_live_system=$((size_live_system * 2**10 / 10**3))
rel_size_partition_iso=$((100 * (mb_size_live_system ) / mb_size_stick))
rel_size_partition_iso=$((100 * (mb_size_live_system + mb_size_space_buffer) / mb_size_stick + 1))

offset_start_partition_persistence=$((rel_size_partition_fat32 + rel_size_partition_iso))

# create conventional DOS partition table
parted  ${DEVICE} mklabel msdos

# create an EFI boot & data exchange partition
parted  --align=optimal ${DEVICE} mkpart primary fat32 0% ${rel_size_partition_fat32}%

# msdos disk labels do not support partition names, only gpt
#parted ${DEVICE} name 1 EFIBOOT

parted  ${DEVICE} set 1 boot on

# do not set both!
#parted  ${DEVICE} set 1 esp on
#parted  ${DEVICE} set 1 hidden on

# create the main live-system partition
parted  --align=optimal -- ${DEVICE} mkpart primary ext2 ${rel_size_partition_fat32}% ${offset_start_partition_persistence}%
parted  ${DEVICE} set 2 hidden on

parted  --align=optimal -- ${DEVICE} mkpart primary ext4 ${offset_start_partition_persistence}% 100%
parted  ${DEVICE} set 3 hidden on

# ntfs/fuse is tOo0Oo SLOW! => maybe exfat some day.
#parted  --align=optimal -- ${DEVICE} mkpart primary ntfs 50% 100%

# write out all changes to disk
time sync

MAIN_LABEL=live-system

{
    # now reread the partition table
    partprobe ${DEVICE}
    partprobe --summary ${DEVICE}
    parted ${DEVICE} align-check minimal 2
    parted ${DEVICE} align-check optimal 2
    parted ${DEVICE} align-check minimal 3
    parted ${DEVICE} align-check optimal 3
    parted ${DEVICE} print free

    # the EFI boot partition needs to be FAT32 which
    # is perfect for file exchange with inferior OSs
    mkfs.vfat -vn SCHULSTICK -F 32 ${DEVICE}${p}1

    # the live system main storage partition
    mkfs.ext2 -L ${MAIN_LABEL} -m 0 ${DEVICE}${p}2

    # persistence storage
    mkfs.ext4 -L live-memory ${DEVICE}${p}3

    # ext4 is less speed hiccups
    #mkfs.btrfs -L ${MAIN_LABEL} ${DEVICE}${p}2
    #mkfs.ntfs --fast --label ${MAIN_LABEL} ${DEVICE}${p}2
    #mkfs.exfat -n ${MAIN_LABEL} ${DEVICE}${p}2

    # the user data partition that was considered
    #mkfs.ntfs --fast --label linux-userdata ${DEVICE}${p}3
    #mkfs.ext4 -L linux-systemdata ${DEVICE}${p}3
} |& ccze -A -o nolookups

debug_pause

MOUNTDIR=/media
EFIBOOT=${MOUNTDIR}/efiboot
ISOSTORE=${MOUNTDIR}/isostore
PERSISTENCESTORE=${MOUNTDIR}/persistencestore
USERDATA=${MOUNTDIR}/userdata
SYSTEMCONFIG=${MOUNTDIR}/systemconfig
SYSTEMDATA=${MOUNTDIR}/systemdata
SYSTEM=${MOUNTDIR}/system

# create mount directories
mkdir -pv ${EFIBOOT} ${ISOSTORE} ${PERSISTENCESTORE} ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

# mount the partitions
mount -v ${DEVICE}${p}1 ${EFIBOOT}
mount -v ${DEVICE}${p}2 ${ISOSTORE}
mount -v ${DEVICE}${p}3 ${PERSISTENCESTORE}

# install the grub bootloader for different platforms
# takes 19 seconds
time grub-install --target=i386-pc --no-floppy --force --removable --root-directory=${EFIBOOT} ${DEVICE} |& tee /media/grub-install-$(date "+%F__%R").i386-pc.log | ccza
# takes 15 seconds
time grub-install --target=i386-efi --uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT} |& tee /media/grub-install-$(date "+%F__%R").i386-efi.log | ccza
# takes 16 seconds
# --uefi-secure-boot is default btw
time grub-install --target=x86_64-efi --uefi-secure-boot --no-nvram --force-extra-removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT} |& tee /media/grub-install-$(date "+%F__%R").x86_64-efi.log | ccza

# Variablen für download url's (hdt.iso , memtest.iso  ....)
#URL_HDT_ISO=http://github.com/knightmare2600/hdt/blob/master/hdt-0.5.2.iso
#URL_MEMTEST_ISO=http://www.memtest.org/download/5.01/memtest86+-5.01.iso        #.gz
#URL_SUPERGRUB2_ISO=https://sourceforge.net/projects/supergrub2/files/2.02s9/super_grub2_disk_2.02s9/super_grub2_disk_hybrid_2.02s9.iso

# fill in grub.cfg template variables
export DATE=$(date)
export MAIN_LABEL
export STICK_ISO=$(basename ${LIVE_IMAGE})
export STICK_VERSION=$(echo ${STICK_ISO}|sed 's/[_-]/ /g;s/\..*//')
export HDT=0
#export MEMTEST=1

# start constructing kernel command line
BOOTOPTIONS=""

# languages to support
BOOTOPTIONS+="locales=de_DE.UTF-8,en_GB.UTF-8 "

BOOTOPTIONS+="keyboard-layouts=de "
BOOTOPTIONS+="timezone=Europe/Berlin "

# let kernel keep the current grafix mode
BOOTOPTIONS+="vga=current "

# preserve oldschool interfaces eth0 wlan0 etc.
BOOTOPTIONS+="net.ifnames=0 "

# list the persistence subdivisions we created
BOOTOPTIONS+="persistence-label=linux-userdata,linux-systemconfig,linux-systemdata,linux-system "

# accepted encrypted & unencrypted persistence volumes
BOOTOPTIONS+="persistence-encryption=none,luks "

# if the label name matches, a persistence volume can be a directory, and image file or partition
BOOTOPTIONS+="persistence-storage=directory,file,filesystem "

# turn off spectre & co. security mitigations for a nice speed boost
BOOTOPTIONS+="mitigations=off "

# debug logging of the live-boot scripts
# BOOTOPTIONS+="live-boot.debug "

# redirect console output to virtual serial port for debugging in qemu
# BOOTOPTIONS+="console=ttyS0 "

# enable root login
BOOTOPTIONS+="rootpw=Risiko "

# disallow risky administration tasks without password
#BOOTOPTIONS+="noroot "

# don't scare the meek: silence the boot noise
BOOTOPTIONS+="quiet "

# show a friendly boot screen
BOOTOPTIONS+="splash"

export BOOTOPTIONS
echo "'$BOOTOPTIONS'"

# generate grub config from jinja template using j2 (not in debian yet; pip3 install j2cli)
j2 variants/common/grub.cfg.j2 > ${EFIBOOT}/boot/grub/grub.cfg

# teh glorious FSFW merch
cp -av variants/base_Xfce_buster_amd64/system-config/bootloaders/grub-pc/fsfw-background_640x480.png ${EFIBOOT}/boot/grub/

# copy the memdisk bootloader
if [ ! -f ${EFIBOOT}/boot/memdisk ]; then cp -av /usr/lib/syslinux/memdisk ${EFIBOOT}/boot/memdisk ; fi

# mark all files on the EFI partition as hidden system files
# so it can be used for data exchange with other systems
fatattr +hs ${EFIBOOT}/*

# these might become image files on an exfat partition
#time truncate --size=1G ${MAINSTORE}/linux-userdata.img
#time truncate --size=128M ${MAINSTORE}/linux-systemconfig.img
#time truncate --size=256M ${MAINSTORE}/linux-systemdata.img
#time truncate --size=1G ${MAINSTORE}/linux-system.img

#time mkfs.ext4 -m 0 -L userdata ${MAINSTORE}/linux-userdata.img
#time mkfs.ext4 -m 0 -L systemconfig ${MAINSTORE}/linux-systemconfig.img
#time mkfs.ext4 -m 0 -L systemdata ${MAINSTORE}/linux-systemdata.img
#time mkfs.ext4 -m 0 -L system ${MAINSTORE}/linux-system.img

# "linux-userdata" vs "EigeneDateien"
mkdir -pv ${PERSISTENCESTORE}/linux-userdata
mount -v --bind ${PERSISTENCESTORE}/linux-userdata ${USERDATA}

mkdir -pv ${PERSISTENCESTORE}/linux-systemconfig
mount -v --bind ${PERSISTENCESTORE}/linux-systemconfig ${SYSTEMCONFIG}

mkdir -pv ${PERSISTENCESTORE}/linux-systemdata
mount -v --bind ${PERSISTENCESTORE}/linux-systemdata ${SYSTEMDATA}

mkdir -pv ${PERSISTENCESTORE}/linux-system
mount -v --bind ${PERSISTENCESTORE}/linux-system ${SYSTEM}

#mount -v ${MAINSTORE}/linux-systemdata.img ${SYSTEMDATA}
#mount -v ${DEVICE}${p}3 ${SYSTEMDATA}
#mount -v ${MAINSTORE}/linux-system.img ${SYSTEM}

# home persistence
#echo "/home/user bind,source=." > ${USERDATA}/persistence.conf
echo "/home bind,source=." > ${USERDATA}/persistence.conf

# systemconfig persistence: network connections and printer configuration
echo "/etc/cups source=printer-configuration" >  ${SYSTEMCONFIG}/persistence.conf
echo "/etc/NetworkManager/system-connections source=network-connections" >>  ${SYSTEMCONFIG}/persistence.conf

# systemdata persistence: stuff
echo "/var/lib union,source=var-lib" >  ${SYSTEMDATA}/persistence.conf
echo "/usr/src union,source=usr-src" >>  ${SYSTEMDATA}/persistence.conf

# system persistence: to be !DELETED! before update
echo "/ union,source=rootfs" >  ${SYSTEM}/persistence.conf

# binding etc gives full git ability from outside
# echo "/etc bind,source=etc" >>  ${SYSTEM}/persistence.conf

# union mount for etc allows shipping hotfixes
echo "/etc union,source=etc" >>  ${SYSTEM}/persistence.conf

# example hotfix 2019-10-22--0
# mkdir -pv ${SYSTEM}/etc/rw/skel/.mozilla/firefox/fsfw1234.default
# echo 'user_pref("browser.search.widget.inNavBar", true);' > ${SYSTEM}/etc/rw/skel/.mozilla/firefox/fsfw1234.default/user.js

echo "/var/lib/apt union,source=var-lib-apt" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/aptitude union,source=var-lib-aptitude" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dlocate union,source=var-lib-dlocate" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dpkg union,source=var-lib-dpkg" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/live union,source=var-lib-live" >>  ${SYSTEM}/persistence.conf

# now actually copy the stick image
mkdir -pv ${ISOSTORE}/boot
time cp -aviL "${LIVE_IMAGE}" ${ISOSTORE}/boot/

# mark boot dir and image files on main partition as hidden system files
#fatattr +hs ${MAINSTORE}/{boot,linux-*}
#fatattr +hs ${MAINSTORE}/{boot,*.img}

echo "everything done, unmounting ${DEVICE}.."
debug_pause

time umount -v ${USERDATA}
time umount -v ${SYSTEMCONFIG}
time umount -v ${SYSTEMDATA}
time umount -v ${SYSTEM}
time umount -v ${EFIBOOT}
time umount -v ${ISOSTORE}
time umount -v ${PERSISTENCESTORE}
rmdir -v ${EFIBOOT} ${ISOSTORE} ${PERSISTENCESTORE} ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

# vim:ts=4:sts=4:sw=4:expandtab
