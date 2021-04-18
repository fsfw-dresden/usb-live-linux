mkdir -pv ${ISOSTORE}/boot
print_info "now copying $(numfmt --to=iec-i --suffix B ${SIZE_LIVE_SYSTEM}) live ISO image to ${DEVICE}${p}2:/boot"
print_warn "(Note that, because of write caching, the file transfer speed displayed does not represent the actual device write speed.)"

rsync --times --inplace --info=progress2 --human-readable --copy-links "../${LIVE_IMAGE}" ${ISOSTORE}/boot/ \
    && print_info "synchronizing unwritten data to disk.." \
    && sync ${ISOSTORE}/boot/ \
    && print_success "copying ${LIVE_IMAGE} to ${DEVICE} completed; please wait for all scripts to finish"
