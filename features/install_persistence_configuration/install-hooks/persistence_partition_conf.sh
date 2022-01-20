check_dependencies f2fs-tools

# FIXME: code duplication with features/live-boot_hook_persistence_prepare

trap_umount_persistencedirs() {
    umount ${USERDATA}
    umount ${SYSTEMCONFIG}
    umount ${SYSTEMDATA}
    umount ${SYSTEM}
}

if is_f2fs_mountable
then
    print_info "preparing F2FS persistence volume"

    USERDATA=${MOUNTDIR}/userdata
    SYSTEMCONFIG=${MOUNTDIR}/systemconfig
    SYSTEMDATA=${MOUNTDIR}/systemdata
    SYSTEM=${MOUNTDIR}/system

    # create mount directories
    mkdir -p ${USERDATA} ${SYSTEMCONFIG} ${SYSTEMDATA} ${SYSTEM}

    mkdir -pv ${PERSISTENCESTORE}/linux-userdata
    mount --bind ${PERSISTENCESTORE}/linux-userdata ${USERDATA}

    mkdir -pv ${PERSISTENCESTORE}/linux-systemconfig
    mount --bind ${PERSISTENCESTORE}/linux-systemconfig ${SYSTEMCONFIG}

    mkdir -pv ${PERSISTENCESTORE}/linux-systemdata
    mount --bind ${PERSISTENCESTORE}/linux-systemdata ${SYSTEMDATA}

    mkdir -pv ${PERSISTENCESTORE}/linux-system
    mount --bind ${PERSISTENCESTORE}/linux-system ${SYSTEM}

    # set up the exit trap to unmount theses bind-mounted persistence directories
    trap "trap_umount_persistencedirs" EXIT SIGHUP SIGQUIT SIGTERM

    # home persistence
    # TODO: f2fscrypt add_key -S 0x42
    echo "/home bind,source=." > ${USERDATA}/persistence.conf

    # systemconfig persistence: network connections and printer configuration
    echo "/etc/cups union,source=printer-configuration" >  ${SYSTEMCONFIG}/persistence.conf
    echo "/etc/NetworkManager/system-connections union,source=network-connections" >>  ${SYSTEMCONFIG}/persistence.conf

    # systemdata persistence: stuff
    echo "/root union,source=root-user" > ${SYSTEMDATA}/persistence.conf
    echo "/usr/src union,source=usr-src" >>  ${SYSTEMDATA}/persistence.conf
    echo "/var/lib union,source=var-lib" >>  ${SYSTEMDATA}/persistence.conf

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
else
    print_warn "f2fs kernel module seems not to be available - all hope now on the 0020-persistence-init.sh hook"
fi
