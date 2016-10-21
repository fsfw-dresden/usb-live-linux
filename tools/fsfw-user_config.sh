#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# erstellten der user Konfiguration aus doc/src_user-config/*  
# und schreibt sie nach "config/includes.chroot/home/user/" und "config/includes.chroot/etc/..."
#
#


# git-versionsnummer / link --> config/includes.chroot/home/user/.version_fsfw-uni-stick
#
echo " FSFW_UNI_STICK_VERSION = "$(echo "$(../tools/calc-version-number.sh)")" " > config/includes.chroot/home/user/.version_fsfw-uni-stick
echo " git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/home/user/.version_fsfw-uni-stick

#
