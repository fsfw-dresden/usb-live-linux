check_dependencies f2fs-tools

# FIXME: code duplication with features/live-boot_hook_persistence_prepare

if is_f2fs_mountable
then
    print_info "preparing F2FS persistence volume"

    mkdir -pv ${PERSISTENCESTORE}/linux-userdata
    mkdir -pv ${PERSISTENCESTORE}/linux-systemconfig
    mkdir -pv ${PERSISTENCESTORE}/linux-systemdata
    mkdir -pv ${PERSISTENCESTORE}/linux-system

    # home persistence
    # TODO: encryption using something like f2fscrypt add_key -S 0x42
    {
        echo "/home bind,source=."
    } > ${PERSISTENCESTORE}/linux-userdata/persistence.conf

    # systemconfig persistence: network connections and printer configuration
    {
        echo "/etc/cups union,source=printer-configuration"
        echo "/etc/NetworkManager/system-connections union,source=network-connections"
    } > ${PERSISTENCESTORE}/linux-systemconfig/persistence.conf

    # systemdata persistence: stuff
    {
        echo "/root union,source=root-user"
        echo "/usr/src union,source=usr-src"
        echo "/var/lib union,source=var-lib"
    } > ${PERSISTENCESTORE}/linux-systemdata/persistence.conf

    # system persistence: to be !DELETED! before update
    {
        echo "/ union,source=rootfs"
        echo "/etc union,source=etc"
        echo "/var/lib/apt union,source=var-lib-apt"
        echo "/var/lib/aptitude union,source=var-lib-aptitude"
        echo "/var/lib/dlocate union,source=var-lib-dlocate"
        echo "/var/lib/dpkg union,source=var-lib-dpkg"
        echo "/var/lib/live union,source=var-lib-live"
    } > ${PERSISTENCESTORE}/linux-system/persistence.conf
else
    print_warn "f2fs kernel module seems not to be available - all hope now on the 0020-persistence-init.sh hook"
fi
