check_dependencies grub-pc-bin grub-efi-ia32-bin shim-signed syslinux-common libcdio-utils

# FIXME: remove this? had been used to debug failing github-actions build..
# if the image is small, it is a test image to short cut an automated build process
if [ ${SIZE_LIVE_SYSTEM} -gt 16777216 ]
then
    mkdir -p ${EFIBOOT}/boot
    print_info "extracting kernel and init ramdisk from ISO to directly boot partition of type 0"
    iso-read -e live/vmlinuz -o ${EFIBOOT}/boot/vmlinuz -i ../${LIVE_IMAGE}
    iso-read -e live/initrd.img -o ${EFIBOOT}/boot/initrd.img -i ../${LIVE_IMAGE}
else
    print_warn "skipping kernel/initrd extraction for fake build test ISO: this will not boot!"
fi

GRUB_VERSION=$(dpkg-query --show --showformat='${Version}' grub2-common)
print_info "installing grub bootloader for i386-pc, i386-efi and x86_64-efi platform to ${DEVICE}\n\t(should take 5-20 seconds each)"
print_info "installed grub version seems to be ${GRUB_VERSION} .."

# --uefi-secure-boot is default in 2.02, but make it explicit
grub-install --target=i386-efi --uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
grub-install --target=i386-pc --no-floppy --force --removable --root-directory=${EFIBOOT} ${DEVICE}

# ubuntu is missing https://salsa.debian.org/grub-team/grub/-/blob/master/debian/patches/grub-install-extra-removable.patch
dpkg-query --show grub2-common | grep -qs "ubuntu" && FORCE_EXTRA= || FORCE_EXTRA="--force-extra-removable"

grub-install --target=x86_64-efi --uefi-secure-boot --no-nvram ${FORCE_EXTRA} --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}

# FIXME: remove? will we ever use the github actions build again?
# something is twisted wrong with the github build VM:
# with all grub packages from debian pulled in, it still misnames the EFI folder
[ ! -d ${EFIBOOT}/EFI/ubuntu ] || mv -v ${EFIBOOT}/EFI/ubuntu ${EFIBOOT}/EFI/debian
