#!/bin/sh
# Sets the last image property in xfce desktop configuration to image link in cycling pool given as argument.
TARGET_DIR="/usr/local/share/backgrounds/cycled"
LINK_NAME="${@}"

sed -i "/\"last-image\"/ s#value=\"[^\"]*\"#value=\"${TARGET_DIR}/${LINK_NAME}\"#" /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
