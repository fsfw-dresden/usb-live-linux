#!/bin/bash
# ad-hoc live stick installation script
# BETA status
# Kein Backup
# Kein Mitleid

. "`dirname "${0}"`/functions.sh"
cd_repo_root

pause() {
  true && return
  echo
  read -n1 -p "Press [q] to quit, [any other] key to proceed.."
  [ "$REPLY" = "q" ] && exit 0
}

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


[ $(grep -c "${DEVICE#/dev/}[[:alnum:]]\+$" /proc/partitions) -gt 0 ] && parted --script ${DEVICE} print free
pause

# --script ?
set -x

# create conventional DOS partition table
parted  ${DEVICE} mklabel msdos

# create an EFI boot partition
#parted --align=opt  ${DEVICE} mkpart primary fat32 0 256
parted  --align=optimal ${DEVICE} mkpart primary fat32 0% 10%
#parted ${DEVICE} name 1 EFIBOOT # msdos disk labels do not support partition names.
parted  ${DEVICE} set 1 boot on
##parted  ${DEVICE} set 1 esp on
#parted  ${DEVICE} set 1 hidden on
# do not set both! parted  ${DEVICE} set 1 hidden on

# create the main live-system partition and a 1GiB data partition
parted  --align=optimal -- ${DEVICE} mkpart primary ext4 10% 50%
#parted  --align=optimal -- ${DEVICE} mkpart primary btrfs 1% 50%
parted  ${DEVICE} set 2 hidden on
# ntfs/fuse is tOo0Oo SLOW!
#parted  --align=optimal -- ${DEVICE} mkpart primary ntfs 50% 100%
##parted  --align=optimal -- ${DEVICE} mkpart primary ntfs 256MiB 100%

# create only an ext4 part
#parted  --align=optimal -- ${DEVICE} mkpart primary ext4 256MiB 100%

# write out all changes to disk
time sync

# now reread the partition table
partprobe ${DEVICE}
partprobe --summary ${DEVICE}
parted ${DEVICE} align-check minimal 2
parted ${DEVICE} align-check optimal 2
# parted ${DEVICE} align-check minimal 3
# parted ${DEVICE} align-check optimal 3
parted ${DEVICE} print free

# the EFI boot partition needs to be FAT32
#mkfs.vfat -vn EFIBOOT -F 32 ${DEVICE}${p}1
mkfs.vfat -vn DEBIAN-LIVE -F 32 ${DEVICE}${p}1

# the live system main storage partition
LABEL=live-system
mkfs.ext4 -L ${LABEL} ${DEVICE}${p}2
#mkfs.btrfs -L ${LABEL} ${DEVICE}${p}2
#mkfs.exfat -n ${LABEL} ${DEVICE}${p}2
# mkfs.ntfs --fast --label ${LABEL} ${DEVICE}${p}2

# the user data partition
#mkfs.ext4 -L linux-userdata ${DEVICE}${p}3
#mkfs.ntfs --fast --label linux-userdata ${DEVICE}${p}3
#mkfs.ext4 -L linux-systemdata ${DEVICE}${p}3

pause

MOUNTDIR=/media
EFIBOOT=${MOUNTDIR}/efiboot
MAINSTORE=${MOUNTDIR}/mainstore
USERDATA=${MOUNTDIR}/userdata
SYSTEMCONFIG=${MOUNTDIR}/systemconfig
SYSTEMDATA=${MOUNTDIR}/systemdata
SYSTEM=${MOUNTDIR}/system

# create mount directories
mkdir -pv ${EFIBOOT} ${MAINSTORE} ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

# mount the partitions
mount -v ${DEVICE}${p}1 ${EFIBOOT}
mount -v ${DEVICE}${p}2 ${MAINSTORE}
#mount -v ${DEVICE}${p}3 ${USERDATA}

# install the grub bootloader for different platforms
# takes 19 seconds
time grub-install --target=i386-pc --no-floppy --force --removable --root-directory=${EFIBOOT} ${DEVICE}
# takes 15 seconds
#time grub-install --target=i386-efi --no-uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
# takes 16 seconds
time grub-install --target=x86_64-efi --uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}

# Variablen für download url's (hdt.iso , memtest.iso  ....)
#URL_HDT_ISO=http://github.com/knightmare2600/hdt/blob/master/hdt-0.5.2.iso
#URL_MEMTEST_ISO=http://www.memtest.org/download/5.01/memtest86+-5.01.iso        #.gz
#URL_SUPERGRUB2_ISO=https://sourceforge.net/projects/supergrub2/files/2.02s9/super_grub2_disk_2.02s9/super_grub2_disk_hybrid_2.02s9.iso

# fill in grub.cfg template variables
export DATE=$(date)
export LABEL
export STICK_ISO=$(basename ${LIVE_IMAGE})
export STICK_VERSION=$(echo ${STICK_ISO}|sed 's/[_-]/ /g;s/\..*//')
export HDT=0
#export MEMTEST=1
# export BOOTOPTIONS="locales=de_DE.UTF-8 keyboard-layouts=de timezone=Europe/Berlin utc=no vga=current net.ifnames=0 persistence-label=linux-userdata,linux-systemconfig.img,linux-systemdata.img,linux-system.img persistence-encryption=none,luks persistence-storage=directory,file,filesystem quiet splash"
#export BOOTOPTIONS="locales=de_DE.UTF-8 keyboard-layouts=de timezone=Europe/Berlin utc=no vga=current net.ifnames=0 persistence-label=linux-userdata,linux-systemconfig.img,linux-systemdata.img,linux-system.img persistence-encryption=none,luks persistence-storage=directory,file,filesystem mitigations=off live-boot.debug _console=ttyS0"
export BOOTOPTIONS="locales=de_DE.UTF-8 keyboard-layouts=de timezone=Europe/Berlin utc=no vga=current net.ifnames=0 persistence-label=linux-userdata,linux-systemconfig,linux-systemdata,linux-system persistence-encryption=none,luks persistence-storage=directory,file,filesystem mitigations=off live-boot.debug console=ttyS0 splash"
#export BOOTOPTIONS="locales=de_DE.UTF-8 keyboard-layouts=de timezone=Europe/Berlin utc=no vga=current net.ifnames=0 persistence-label=EigeneDateien,linux-systemconfig,linux-systemdata,linux-system persistence-encryption=none,luks persistence-storage=directory,file,filesystem mitigations=off live-boot.debug console=ttyS0 splash"
#export BOOTOPTIONS="locales=de_DE.UTF-8 keyboard-layouts=de timezone=Europe/Berlin utc=no vga=current net.ifnames=0 persistence-label=EigeneDateien,linux-systemconfig,linux-systemdata,linux-system persistence-encryption=none,luks persistence-storage=directory,file,filesystem mitigations=off quiet splash"

# generate grub config from jinja template using j2 (not in debian yet; pip install j2cli)
j2 variants/common/grub.cfg.j2 > ${EFIBOOT}/boot/grub/grub.cfg

# teh glorious merch
cp -av variants/base_Xfce_buster_amd64/system-config/bootloaders/grub-pc/fsfw-background_640x480.png ${EFIBOOT}/boot/grub/

# copy the memdisk bootloader
if [ ! -f ${EFIBOOT}/boot/memdisk ]; then cp -av /usr/lib/syslinux/memdisk ${EFIBOOT}/boot/memdisk ; fi

# mark all files on the EFI partition as hidden system files
fatattr +hs ${EFIBOOT}/*

# takes x seconds
#time truncate --size=1G ${MAINSTORE}/linux-userdata.img
# time truncate --size=128M ${MAINSTORE}/linux-systemconfig.img
#time truncate --size=256M ${MAINSTORE}/linux-systemdata.img
#time truncate --size=1G ${MAINSTORE}/linux-system.img

#time mkfs.ext4 -m 0 -L userdata ${MAINSTORE}/linux-userdata.img
# time mkfs.ext4 -m 0 -L systemconfig ${MAINSTORE}/linux-systemconfig.img
#time mkfs.ext4 -m 0 -L systemdata ${MAINSTORE}/linux-systemdata.img
#time mkfs.ext4 -m 0 -L system ${MAINSTORE}/linux-system.img

#mount -v ${MAINSTORE}/linux-userdata.img ${USERDATA}
# mkdir -pv ${MAINSTORE}/EigeneDateien
# mount -v --bind ${MAINSTORE}/EigeneDateien ${USERDATA}
# mount -v ${MAINSTORE}/linux-systemconfig.img ${SYSTEMCONFIG}
mkdir -pv ${MAINSTORE}/linux-systemconfig
mount -v --bind ${MAINSTORE}/linux-systemconfig ${SYSTEMCONFIG}
mkdir -pv ${MAINSTORE}/linux-systemdata
mount -v --bind ${MAINSTORE}/linux-systemdata ${SYSTEMDATA}
mkdir -pv ${MAINSTORE}/linux-system
mount -v --bind ${MAINSTORE}/linux-system ${SYSTEM}
mkdir -pv ${MAINSTORE}/EigeneDateien
mount -v --bind ${MAINSTORE}/EigeneDateien ${USERDATA}

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
echo "/var/lib union" >  ${SYSTEMDATA}/persistence.conf
echo "/usr/src union" >>  ${SYSTEMDATA}/persistence.conf

# system persistence: to be !DELETED! before update
echo "/ union,source=root" >  ${SYSTEM}/persistence.conf
echo "/etc bind,source=etc" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/apt union,source=var--lib--apt" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/aptitude union,source=var--lib--aptitude" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dlocate union,source=var--lib--dlocate" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dpkg union,source=var--lib--dpkg" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/live union,source=var--lib--live" >>  ${SYSTEM}/persistence.conf

# now actually copy the stick image
mkdir -pv ${MAINSTORE}/boot
time cp -avi "${LIVE_IMAGE}" ${MAINSTORE}/boot/

# mark boot dir and image files on main partition as hidden system files
#fatattr +hs ${MAINSTORE}/{boot,linux-*}
#fatattr +hs ${MAINSTORE}/{boot,*.img}

echo "everything done, unmounting ${DEVICE}.."
pause

time umount -v ${USERDATA}
time umount -v ${SYSTEMCONFIG}
time umount -v ${SYSTEMDATA}
time umount -v ${SYSTEM}
time umount -v ${EFIBOOT}
time umount -v ${MAINSTORE}
rmdir -v ${EFIBOOT} ${MAINSTORE} ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

# vim:ts=4:sts=4:sw=4:expandtab
