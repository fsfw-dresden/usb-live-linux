if grep " ${PERSISTENCESTORE} f2fs" /proc/mounts
then
    print_info "Setting compression attribute on persistence store"
    print_warn '("doesn’t expose compressed space to user" / "main goal is to reduce data writes")'
    find ${PERSISTENCESTORE} -type d -exec chattr -V +c {} +
else
    print_warn "partition ${PERSISTENCESTORE} seems not to be mounted, skipping.."
fi
