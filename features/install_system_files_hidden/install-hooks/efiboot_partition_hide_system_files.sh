check_dependencies fatattr

print_info "hiding files on boot / exchange partition in Linux file manager"
echo "boot" > ${EFIBOOT}/.hidden
echo "EFI" >> ${EFIBOOT}/.hidden
echo "NvVars" >> ${EFIBOOT}/.hidden
echo "System Volume Information" >> ${EFIBOOT}/.hidden

# precreate qemu EFI bios file so it can be hidden in next step
touch ${EFIBOOT}/NvVars

print_info "marking files on boot / exchange as hidden system files\n" \
    "\tso they will not be accidentally deleted in Windows"
fatattr +hs ${EFIBOOT}/* ${EFIBOOT}/.hidden
