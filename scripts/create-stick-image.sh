#!/bin/bash -xv
. "$(dirname $(realpath "${0}"))/functions.sh"
. "$(dirname $(realpath "${0}"))/functions.bash"
cd_repo_root

select_live_iso_for_image() {
    OPTIONS=()
    cd iso-images
    for ISO in $(command ls -Lt *.iso)
    do
        #ISO=${ISO##iso-images}
        SIZESTR=$(numfmt --to=iec-i --suffix B $(stat --dereference --format='%s' "${ISO}"))
        OPTIONS+=(${ISO} "${SIZESTR} $(date --date=@$(stat --dereference --format='%Y' "${ISO}") "+%F %_H:%M:%S")")
    done
    TEXT="Please choose the live system ISO the image should be created for."
    TITLE="SELECT LIVE SYSTEM ISO"
    display_menu "${TITLE}" "${TEXT}" "${OPTIONS[@]}"
}

# ISO can be given as first parameter
[ -n "${1}" ] && ISO=$1 || ISO="iso-images/$(select_live_iso_for_image)"

# try to detect stick type from image name
FAT_LABEL="$(scripts/map-image-name-to-stick-type.sh ${ISO})" || FAT_LABEL="LIVESTICK"

# cut off file ending of ISO and replace with .img
IMG=${ISO##*/}
IMG=${IMG%%.iso}
IMG=${IMG%%.hybrid}.img

# target directory for image file as second parameter
[ -n "${2}" ] && IMG=$2/${IMG}

# total size of image in MiB as 4th parameter
[ -n "${3}" ] && size_mb_disk_image=$3 || size_mb_disk_image=$((10 * 2**10))

# size of boot / data exchange FAT32 partition in MiB as 5th parameter
[ -n "${4}" ] && size_mb_partition_fat32=$4 || size_mb_partition_fat32=1450

# create image file
truncate --size=${size_mb_disk_image}M ${IMG}

# connect image to loop device
LOOP=$(losetup --partscan --verbose --show --find ${IMG})

# install ISO onto it
HOTFIX="none" scripts/stick-install.sh ${LOOP} ${ISO} ${FAT_LABEL} ${size_mb_partition_fat32}

# free loop device
losetup --verbose --detach ${LOOP}
