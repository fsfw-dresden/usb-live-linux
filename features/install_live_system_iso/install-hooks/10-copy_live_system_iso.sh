print_info "now copying $(numfmt --to=iec-i --suffix B ${SIZE_LIVE_SYSTEM}) live ISO image to ${DEVICE}${p}2"
print_warn "(Note that, because of write caching, the file transfer speed displayed may only represent actual device write speed after write buffer has filled.)"

(
    # LIVE_IMAGE URI is either absolute or relative to repo root
    cd $(repo_root)

    rsync --times --inplace --info=progress2 --human-readable --copy-links "${LIVE_IMAGE}" ${ISOSTORE}/ \
        && print_info "synchronizing unwritten data to disk.." \
        && sync ${ISOSTORE}/ \
        && print_success "copying ${LIVE_IMAGE} to ${DEVICE} completed; please wait for all scripts to finish"
)
