check_dependencies grub-pc-bin grub-efi-ia32-bin shim-signed syslinux-common libcdio-utils

(
    # LIVE_IMAGE URI is either absolute or relative to repo root, so cd up
    cd $(repo_root)

    mkdir -p ${EFIBOOT}/boot
    print_info "extracting kernel and init ramdisk from ISO to directly boot partition of type 0"
    iso-read -e live/vmlinuz -o ${EFIBOOT}/boot/vmlinuz -i ${LIVE_IMAGE}
    iso-read -e live/initrd.img -o ${EFIBOOT}/boot/initrd.img -i ${LIVE_IMAGE}
)

GRUB_VERSION=$(dpkg-query --show --showformat='${Version}' grub2-common)
print_info "installing grub bootloader for i386-pc, i386-efi and x86_64-efi platform to ${DEVICE}\n\t(should take 5-20 seconds each)"
print_info "installed grub version seems to be ${GRUB_VERSION} .."

# --uefi-secure-boot is default in 2.02, but make it explicit
grub-install --target=i386-efi --uefi-secure-boot --no-nvram --recheck --removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
grub-install --target=i386-pc --no-floppy --force --removable --root-directory=${EFIBOOT} ${DEVICE}
grub-install --target=x86_64-efi --uefi-secure-boot --no-nvram --force-extra-removable --efi-directory=${EFIBOOT} --root-directory=${EFIBOOT}
