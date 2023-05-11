. ../scripts/functions.bash

# latest release is from a while ago
# https://git.zytor.com/syslinux/syslinux.git/commit/?id=abf5de515ec18826258f72176574dea8a19fc212 
URL_HDT_ISO=https://github.com/knightmare2600/hdt/raw/master/hdt-0.5.2.iso
FILE=$(download_file_cached ${URL_HDT_ISO}) \
    && cp -a ${FILE} ${EFIBOOT}/boot/ \
    && touch --date="2012-09-10 21:03:50 +0200" ${EFIBOOT}/boot/${FILE##*/} \
    || print_warn "Could not download optional Hardware Detection Tool, please check" \
       " whether a network connection\n\tis active and the URL ${URL_HDT_ISO} is working"

URL_MEMTEST=https://memtest.org/download/v6.10/mt86plus_6.10_64.iso.zip
FILE=$(download_file_cached ${URL_MEMTEST}) \
    && unzip -d ${EFIBOOT}/boot/ ${FILE} \
    && mv ${EFIBOOT}/boot/$(basename --suffix=.zip ${FILE}) ${EFIBOOT}/boot/mt86plus.iso \
    || print_warn "Could not download optional Memtest86+, please check" \
       " whether a network connection\n\tis active and the URL ${URL_MEMTEST} is working"
