if grep " ${PERSISTENCESTORE} f2fs" /proc/mounts
then
    print_info "Setting compression attribute on persistence store"
    print_warn "(FIXME: does not seem to be effective?)"
    find ${PERSISTENCESTORE} -type d -exec chattr -V +c {} +
else
    print_warn "partition ${PERSISTENCESTORE} seems not to be mounted, skipping.."
fi
