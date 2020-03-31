#!/bin/bash
# next-generation live stick installation script
# BETA status
# Kein Backup
# KEIN MITLEID

. "$(dirname $(realpath "${0}"))/functions.sh"
. "$(dirname $(realpath "${0}"))/functions.bash"
cd_repo_root
check_dependencies grub-pc-bin grub-efi-ia32-bin shim-signed syslinux-common parted dosfstools libcdio-utils dialog ccze

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
    TITLE="SELECT LIVE SYSTEM TARGET DEVICE"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

select_live_iso() {
    OPTIONS=()
    for ISO in $(command ls -Lt iso-images/*.iso)
    do
        SIZESTR=$(numfmt --to=iec-i --suffix B $(stat --dereference --format='%s' "${ISO}"))
        OPTIONS+=(${ISO} "${SIZESTR} $(date --date=@$(stat --dereference --format='%Y' "${ISO}") "+%F %_H:%M:%S")")
    done
    TEXT="Please choose the live system to be installed on ${DEVICE}"
    TITLE="SELECT LIVE SYSTEM ISO"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

select_fat_label() {
    OPTIONS=()
    for LABEL in SCHULSTICK UNISTICK
    do
        OPTIONS+=( ${LABEL} "" )
    done
    TEXT="Please choose the label for the FAT32 / windows-visible exchange partition"
    TITLE="SELECT PARTITION LABEL"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

select_hotfix() {
    OPTIONS=( "none" "" )
    for HOTFIX in $(command ls -Lt overlay-hotfixes/)
    do
        OPTIONS+=(${HOTFIX} "($(find overlay-hotfixes/${HOTFIX} -type f|wc -l) files)")
    done
    TEXT="Please choose the hotfix to be added ${DEVICE}"
    TITLE="SELECT HOTFIX"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

define_first_partition_size() {
    TEXT="Please define a size for the first partition, which is FAT32 and used for booting as well as for data exchange. The PortableApps.com packages will also be put here.\nFor the boot files to fit, specify at least 90MiB.\n\n"
    TEXT+="  ${size_mb_stick} MiB storage device"
    TEXT+="- ${size_mb_live_system} MiB Live System ISO\n"
    TEXT+="= $(( size_mb_stick - size_mb_live_system )) MiB space for 1st (boot) & 3rd (persistence) partition\n"
    TITLE="DEFINE FIRST PARTITION SIZE"
    INIT=$1
    display_inputbox "${TITLE}" "${TEXT}" ${INIT}
}

# THANKS https://stackoverflow.com/questions/33085008/bash-round-to-nearest-multiple-of-4
round_int_to_next_multiple_of_16() {
    echo $(( ($1 + 15 ) / 16 * 16 ))
}

# target DEVICE can be given as first parameter or interactively selected
[ -b "$1" ] && DEVICE=$1 || DEVICE=$(select_target_device)
#clear -x
echo "DEVICE=${DEVICE}"

# no device no play
[ -z ${DEVICE} ] && echo "no DEVICE chosen, cannot continue" >&2 && exit 2

# proceed only if selected device is not mounted
grep -s "^${DEVICE}" /proc/mounts && print_warn "partition(s) on ${DEVICE} currently mounted, not continuing!" >&2 && exit 1

# loop devices have a different naming scheme (loop3p1 vs sdc1)
[[ "$DEVICE" =~ "loop" ]] && p="p" || p=""

# the LIVE_IMAGE iso file can be given as second parameter or interactively selected
[ -f "iso-images/$2" ] && LIVE_IMAGE="iso-images/$2" || [ -f "$2" ] && LIVE_IMAGE="$2" || LIVE_IMAGE=$(select_live_iso)
#clear -x
echo "LIVE_IMAGE=${LIVE_IMAGE}"

# no ISO no burn
[ -z ${LIVE_IMAGE} ] && echo "no LIVE_IMAGE chosen, cannot continue" >&2 && exit 2

# FAT_LABEL can be given as third parameter - or interactively selected
[ -n "$3" ] && FAT_LABEL=$3 || FAT_LABEL=$(select_fat_label)
echo "FAT_LABEL=${FAT_LABEL}"

# set HOTFIX environment variable to "none" to skip selection
[ -z ${HOTFIX} ] && HOTFIX=$(select_hotfix) || HOTFIX="none"
echo "HOTFIX=${HOTFIX}"

# any partitions on the device? => show the layout
[ $(grep -c "${DEVICE#/dev/}[[:alnum:]]\+$" /proc/partitions) -gt 0 ] && parted --script ${DEVICE} print free
debug_pause

# get block device size in MebiByte
size_stick=$(blockdev --getsize64 ${DEVICE})
size_mb_stick=$(( size_stick / (1024 * 1024) ))

# get ISO live image size in MebiByte
size_live_system=$(stat --dereference --format=%s ${LIVE_IMAGE})
size_mb_live_system=$(( size_live_system / (1024 * 1024) ))

print_info "figuring out partition sizes for $(numfmt --to=iec-i --suffix B ${size_stick}) storage device"

# >~ 114 MiB for the filesystem gods
size_mb_space_buffer=150

[ -n "$4" ] && size_mb_partition_fat32=$4 || \
if [ "${FAT_LABEL}" = "SCHULSTICK" ]
then
    # 2000MB: space for exchange, no portableapps yet
    size_mb_partition_fat32=$(define_first_partition_size 2000)
else
    # 5000MB: for windows portableapps etc.
    size_mb_partition_fat32=$(define_first_partition_size 5000)
fi

# try to put partition boundaries on flash cell erasure block boundaries assumed to be 16MiB
size_mb_partition_fat32=$(round_int_to_next_multiple_of_16 ${size_mb_partition_fat32})

size_mb_partition_live_image=$(( size_mb_live_system + size_mb_space_buffer ))
end_mb_partition_live_image=$(round_int_to_next_multiple_of_16 $((size_mb_partition_fat32 + size_mb_partition_live_image)) )

# [ -e /run/udev/queue ] && rm -v /run/udev/queue && echo "prevented udevadm settle hang by #####"
# here be dragons
#[ -e /run/udev/queue ] && echo "prevent udevadm settle hang by #####"

print_info "creating conventional DOS partition table.."
parted --script ${DEVICE} mklabel msdos

# create an EFI boot & data exchange partition
parted --script --align=optimal ${DEVICE} mkpart primary fat32 2048s ${size_mb_partition_fat32}MiB
parted ${DEVICE} set 1 boot on
print_info "created 0 - ${size_mb_partition_fat32}MiB fat32 data exchange / EFI boot partition"

# create the main live-system partition
parted --script --align=optimal -- ${DEVICE} mkpart primary ${size_mb_partition_fat32}MiB ${end_mb_partition_live_image}MiB
print_info "created ${size_mb_partition_fat32}% - ${end_mb_partition_live_image}% live system partition (will be formatted ext2)"

# create a small persistence partition that will be grown on first boot to device limits
# allows distributing a smaller image file that will fit USB sticks of varying size
end_mb_partition_persistence=$(( end_mb_partition_live_image + 128 ))
parted --script --align=optimal -- ${DEVICE} mkpart primary ${end_mb_partition_live_image}MiB ${end_mb_partition_persistence}MiB
print_info "created ${end_mb_partition_live_image}MiB - ${end_mb_partition_persistence}MiB persistence partition (will be formatted f2fs)"

MAIN_LABEL=live-system

print_info "rereading partition table and checking partition alignment"
partprobe --summary ${DEVICE}
parted ${DEVICE} unit MiB print free
parted ${DEVICE} align-check minimal 2
parted ${DEVICE} align-check optimal 2
parted ${DEVICE} align-check minimal 3
parted ${DEVICE} align-check optimal 3

print_info "setting 2nd + 3rd partition to type 0 / empty because.. Windows 10"
sfdisk --part-type ${DEVICE} 2 0
sfdisk --part-type ${DEVICE} 3 0

print_info "creating filesystems"
# the EFI boot partition needs to be FAT32 which
# is perfect for file exchange with inferior OSs
mkfs.vfat -vn ${FAT_LABEL} -F 32 ${DEVICE}${p}1

# the live system main storage partition
mkfs.ext2 -FL ${MAIN_LABEL} -m 0 ${DEVICE}${p}2

# persistence storage
#mkfs.ext4 -L live-memory ${DEVICE}${p}3
mkfs.f2fs -fd 5 -l live-memory ${DEVICE}${p}3

debug_pause

# CLEAN-UP TRAPS
# once set, these will fire on script exit or abortionq
trap_remove_mountdir() { rmdir ${MOUNTDIR}; }
trap_remove_mountsubdirs() { rmdir ${MOUNTDIR}/*; }
trap_umount_persistencedirs() {
    umount ${USERDATA}
    umount ${SYSTEMCONFIG}
    umount ${SYSTEMDATA}
    umount ${SYSTEM}
}
trap_umount_partitions() {
    umount -v ${DEVICE}${p}1
    umount -v ${DEVICE}${p}2
    umount -v ${DEVICE}${p}3
}

# create a temporary directory to hold the mounts
MOUNTDIR=$(mktemp --tmpdir --directory stick-install.XXXX)

# exit TRAP: at this point, only the temporary mountdir to clean up
trap "trap_remove_mountdir" EXIT SIGHUP SIGQUIT SIGTERM

EFIBOOT=${MOUNTDIR}/efiboot
ISOSTORE=${MOUNTDIR}/isostore
PERSISTENCESTORE=${MOUNTDIR}/persistencestore
USERDATA=${MOUNTDIR}/userdata
SYSTEMCONFIG=${MOUNTDIR}/systemconfig
SYSTEMDATA=${MOUNTDIR}/systemdata
SYSTEM=${MOUNTDIR}/system

# create mount directories
mkdir -pv ${EFIBOOT} ${ISOSTORE} ${PERSISTENCESTORE} ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

# exit TRAP: also remove the created sub directories
trap "trap_remove_mountsubdirs; trap_remove_mountdir" EXIT SIGHUP SIGQUIT SIGTERM

print_info "mounting partitions"
mount -v ${DEVICE}${p}1 ${EFIBOOT}
mount -v ${DEVICE}${p}2 ${ISOSTORE}
mount -v ${DEVICE}${p}3 ${PERSISTENCESTORE}

# exit TRAP: add unmounting storage as first step to the clean-up trap queue
trap "trap_umount_partitions; trap_remove_mountsubdirs; trap_remove_mountdir" EXIT SIGHUP SIGQUIT SIGTERM

print_info "installing grub bootloader for i386-pc, i386-efi and x86_64-efi platform to ${DEVICE}"
print_info "(should take 5-20 seconds each)"
time {
    grub-install --target=i386-pc --no-floppy --force --removable --root-directory=${EFIBOOT} ${DEVICE}
    grub-install --target=i386-efi --uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
    # --uefi-secure-boot is default btw
    grub-install --target=x86_64-efi --uefi-secure-boot --no-nvram --force-extra-removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
    sync ${EFIBOOT}
}

print_info "extracting kernel and init ramdisk from ISO to directly boot partition of type 0"
iso-read -e live/vmlinuz -o ${EFIBOOT}/boot/vmlinuz -i ${LIVE_IMAGE}
iso-read -e live/initrd.img -o ${EFIBOOT}/boot/initrd.img -i ${LIVE_IMAGE}

# Variablen für download url's (hdt.iso , memtest.iso  ....)
#URL_HDT_ISO=http://github.com/knightmare2600/hdt/blob/master/hdt-0.5.2.iso
#URL_MEMTEST_ISO=http://www.memtest.org/download/5.01/memtest86+-5.01.iso        #.gz
#URL_SUPERGRUB2_ISO=https://sourceforge.net/projects/supergrub2/files/2.02s9/super_grub2_disk_2.02s9/super_grub2_disk_hybrid_2.02s9.iso

print_info "filling in grub.cfg template variables"
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
BOOTOPTIONS+="utc=auto "

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

if [ "${FAT_LABEL}" = "SCHULSTICK" ]
then
    # disallow risky administration tasks without password
    BOOTOPTIONS+="noroot "
fi

# don't scare the meek: silence the boot noise
BOOTOPTIONS+="quiet "

# hide ACPI BIOS ERRORS
BOOTOPTIONS+="loglevel=3 "

# show a friendly boot screen
BOOTOPTIONS+="splash"

export BOOTOPTIONS
print_info "BOOTOPTIONS = ${COLOR_OFF}'$BOOTOPTIONS'"

print_info "now generating ${EFIBOOT}/boot/grub/grub.cfg from variants/common_bootloader/grub.cfg.j2"
# generate grub config from jinja template using j2 (not in debian yet; pip3 install j2cli)
j2 variants/common_bootloader/grub.cfg.j2 > ${EFIBOOT}/boot/grub/grub.cfg

print_info "copying bootloader background image — teh glorious FSFW merch!"
cp -av variants/base_Xfce_buster_amd64/system-config/bootloaders/grub-pc/fsfw-background_640x480.png ${EFIBOOT}/boot/grub/

# copy the memdisk bootloader
if [ ! -f ${EFIBOOT}/boot/memdisk ]; then cp -av /usr/lib/syslinux/memdisk ${EFIBOOT}/boot/memdisk ; fi

# init empty qemu EFI bios file so it can be hidden
touch ${EFIBOOT}/NvVars

print_info "hiding files on first partition in linux file manager"
echo "boot" > ${EFIBOOT}/.hidden
echo "EFI" >> ${EFIBOOT}/.hidden
echo "NvVars" >> ${EFIBOOT}/.hidden
echo "System Volume Information" >> ${EFIBOOT}/.hidden

print_info "marking files on the EFI partition as hidden system files"
print_info "(so it can better be used for data exchange with other systems)"
fatattr +hs ${EFIBOOT}/* ${EFIBOOT}/.hidden

cp -av variants/common_FAT_exchange_partition/LIESMICH.txt ${EFIBOOT}/

print_info "preparing persistence volumes"

mkdir -pv ${PERSISTENCESTORE}/linux-userdata
mount --bind ${PERSISTENCESTORE}/linux-userdata ${USERDATA}

mkdir -pv ${PERSISTENCESTORE}/linux-systemconfig
mount --bind ${PERSISTENCESTORE}/linux-systemconfig ${SYSTEMCONFIG}

mkdir -pv ${PERSISTENCESTORE}/linux-systemdata
mount --bind ${PERSISTENCESTORE}/linux-systemdata ${SYSTEMDATA}

mkdir -pv ${PERSISTENCESTORE}/linux-system
mount --bind ${PERSISTENCESTORE}/linux-system ${SYSTEM}

# set up the exit trap to unmount theses bind-mounted persistence directories
trap "trap_umount_persistencedirs; trap_umount_partitions; trap_remove_mountsubdirs; trap_remove_mountdir" EXIT SIGHUP SIGQUIT SIGTERM

# home persistence
echo "/home bind,source=." > ${USERDATA}/persistence.conf

# systemconfig persistence: network connections and printer configuration
echo "/etc/cups union,source=printer-configuration" >  ${SYSTEMCONFIG}/persistence.conf
echo "/etc/NetworkManager/system-connections union,source=network-connections" >>  ${SYSTEMCONFIG}/persistence.conf

# systemdata persistence: stuff
echo "/var/lib union,source=var-lib" >  ${SYSTEMDATA}/persistence.conf
echo "/usr/src union,source=usr-src" >>  ${SYSTEMDATA}/persistence.conf

# system persistence: to be !DELETED! before update
echo "/ union,source=rootfs" >  ${SYSTEM}/persistence.conf

# binding etc gives full git ability from outside
# echo "/etc bind,source=etc" >>  ${SYSTEM}/persistence.conf

# union mount for etc allows shipping hotfixes
echo "/etc union,source=etc" >>  ${SYSTEM}/persistence.conf

echo "/var/lib/apt union,source=var-lib-apt" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/aptitude union,source=var-lib-aptitude" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dlocate union,source=var-lib-dlocate" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/dpkg union,source=var-lib-dpkg" >>  ${SYSTEM}/persistence.conf
echo "/var/lib/live union,source=var-lib-live" >>  ${SYSTEM}/persistence.conf

print_info "now copying $(numfmt --to=iec-i --suffix B ${size_live_system}) live ISO image to ${DEVICE}${p}2:/boot"
time {
    mkdir -pv ${ISOSTORE}/boot
    rsync --times --inplace --info=progress2 --human-readable --copy-links "${LIVE_IMAGE}" ${ISOSTORE}/boot/
    print_info "synchronizing unwritten data to disk.."
    sync ${ISOSTORE}/boot/
}

if [ "${HOTFIX}" != "none" ]
then
    cp -av overlay-hotfixes/${HOTFIX}/* ${PERSISTENCESTORE}/
fi

echo -e "[ ${COLOR_GREEN}OK${COLOR_OFF} ] installing ${STICK_ISO} to ${DEVICE} ${COLOR_GREEN}COMPLETED${COLOR_OFF}, unmounting.."
debug_pause

# unmounts done by traps

# vim:ts=4:sts=4:sw=4:expandtab
