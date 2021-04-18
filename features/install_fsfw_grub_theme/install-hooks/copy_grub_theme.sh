print_info "copying bootloader background image — teh glorious FSFW merch!"
install -vD --target-directory=${EFIBOOT}/boot/grub/ --preserve-timestamps install/data/bootloaders/grub-pc/fsfw-background_640x480.png
