#!/bin/sh

# This is a hook for live-build(7) to install localepurge.
# To enable it, copy or symlink this hook into your config/chroot_local-hooks
# directory.
#

cat > /tmp/localepurge.preseed << EOF
localepurge localepurge/nopurge multiselect en
#localepurge localepurge/mandelete boolean true
#localepurge localepurge/dontbothernew boolean false
localepurge localepurge/showfreedspace boolean false
#localepurge localepurge/quickndirtycalc boolean true
#localepurge localepurge/verbose boolean false
EOF
debconf-set-selections < /tmp/localepurge.preseed
rm -f /tmp/localepurge.preseed

apt-get install --yes localepurge
dpkg-reconfigure localepurge

localepurge
