print_info "filling in grub.cfg template variables"

DATE=$(date)
STICK_ISO=$(basename ${LIVE_IMAGE})
STICK_VERSION=$(echo ${STICK_ISO}|sed 's/[_-]/ /g;s/\..*//')

GRUB_CFG="${EFIBOOT}/boot/grub/grub.cfg"

# start constructing kernel command line
BOOTOPTIONS=""

# languages to support
BOOTOPTIONS+="locales=de_DE.UTF-8 "

BOOTOPTIONS+="keyboard-layouts=de "
BOOTOPTIONS+="keyboard-variants=nodeadkeys "
BOOTOPTIONS+="timezone=Europe/Berlin "
BOOTOPTIONS+="utc=auto "

# let kernel keep the current grafix mode
BOOTOPTIONS+="vga=current "

# preserve oldschool interfaces eth0 wlan0 etc.
BOOTOPTIONS+="net.ifnames=0 "

# list the persistence subdivisions we created
BOOTOPTIONS+="persistence-label=linux-userdata,linux-systemconfig,linux-systemdata,linux-system "

# accept encrypted & unencrypted persistence volumes
# (⚠️ probes all LUKS volumes and asks for password)
#BOOTOPTIONS+="persistence-encryption=none,luks "

# skip all luks volumes and do not ask for passwords
BOOTOPTIONS+="persistence-encryption=none "

# if the label name matches, a persistence volume can be a directory, and image file or partition
BOOTOPTIONS+="persistence-storage=directory,file,filesystem "

if ! [[ "${DEVICE}" =~ ^/dev/loop[0-9]+ ]]
then
    # only scan removable media for persistence volumes
    BOOTOPTIONS+="persistence-media=removable-usb "
fi

# Turn off spectre & co. security mitigations for a nice speed boost
BOOTOPTIONS+="mitigations=off tsx=on "
# FIXME: needs to be disabled if any real-world exploits ever become known (not yet)
# https://techbeacon.com/security/spectre-returns-haunt-us-exploit-hides-plain-sight
#BOOTOPTIONS+="spec_store_bypass_disable=on "

# record bootchart
#BOOTOPTIONS+="init=/lib/systemd/systemd-bootchart "

# debug logging of the live-boot scripts
# BOOTOPTIONS+="live-boot.debug "

# redirect console output to virtual serial port for debugging in qemu
# BOOTOPTIONS+="console=ttyS0 "

if [ "${INSTALL_VARIANT}" = "Schulstick" ]
then
    # no sudo: disallow risky administration tasks without password
    BOOTOPTIONS+="noroot "

    # instead, set a root password for parental use (FIXME: !!)
    BOOTOPTIONS+="rootpw=Risiko "
fi

# don't scare the meek: silence the boot noise
BOOTOPTIONS+="quiet "

# hide ACPI BIOS ERRORS
BOOTOPTIONS+="loglevel=0 "

# show a friendly boot screen
BOOTOPTIONS+="splash"

print_info "BOOTOPTIONS:\n\t$(echo ${BOOTOPTIONS} | sed 's/ \+/\n\t/g')"

print_info "now generating ${GRUB_CFG}"
mkdir -pv "${GRUB_CFG%/*}"
sed -e "s|DATE|${DATE}|" \
    -e "s|STICK_VERSION|${STICK_VERSION}|" \
    -e "s|STICK_ISO|${STICK_ISO}|" \
    -e "s|BOOTOPTIONS|${BOOTOPTIONS}|" \
    install/data/grub.cfg.template > ${GRUB_CFG}

# copy the memdisk bootloader
if [ ! -f ${EFIBOOT}/boot/memdisk ]; then cp -v --preserve=timestamps /usr/lib/syslinux/memdisk ${EFIBOOT}/boot/memdisk ; fi
