check_dependencies fatattr

# precreate qemu EFI bios file so it can be hidden in next step
touch ${EFIBOOT}/NvVars

print_info "marking files on boot / exchange as hidden system files\n" \
    "\tto make accidental deletion in Windows less likely" \
    "\t(also, hide these files in linux, too: via .hidden)"
for FILE in "boot" "EFI" "NvVars" "System Volume Information"
do
  fatattr +hs "${EFIBOOT}/${FILE}" ${EFIBOOT}/.hidden
  echo "${FILE}" >> ${EFIBOOT}/.hidden
done
