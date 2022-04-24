print_info "copying bootloader background image — teh glorious FSFW merch!"
print_info "FIXME: what about that fsfw-theme.txt, content_fsfw-dresden_theme/livefs-include/usr/share/desktop-base/fsfw-theme/grub ?"
install -vD --target-directory=${EFIBOOT}/boot/grub/ --preserve-timestamps install/data/bootloaders/grub-pc/fsfw-background*.png
