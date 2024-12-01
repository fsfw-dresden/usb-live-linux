check_dependencies fatattr

# precreate qemu EFI bios file so it can be hidden in next step
touch "${EFIBOOT}/NvVars"

HIDEFILE="${EFIBOOT}/.hidden"

print_info "marking files on boot / exchange as hidden system files\n" \
    "\tto make accidental deletion in Windows less likely" \
    "\t(also, hide these files in linux, too: via .hidden)"
for FILE in "boot" "EFI" "NvVars" "System Volume Information"
do
  FILEPATH="${EFIBOOT}/${FILE}"
  [ -e "${FILEPATH}" ] && fatattr +hs "${FILEPATH}"
  echo "${FILE}" >> "${HIDEFILE}"
done
fatattr +hs "${HIDEFILE}"
