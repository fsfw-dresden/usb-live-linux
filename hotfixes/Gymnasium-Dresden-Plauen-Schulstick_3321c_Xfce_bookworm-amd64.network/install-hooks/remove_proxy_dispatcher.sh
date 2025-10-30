#!/bin/bash

# abort on error
set -e

HELPERS_DIR=$(realpath ${0%/*}/../helpers)
source ${HELPERS_DIR}/common.sh

[ $# -gt 0 ] || die "device parameter missing!" 2

# third partition: persistent memory for linux
engage_device ${1} 3 "persistence"

# Create overlayfs whiteout character device 0/0 to hide dispatcher script
DISPATCHER_DIR="${MNT_DIR}/linux-system/etc/rw/NetworkManager/dispatcher.d"
eval_cmd "mkdir -p ${DISPATCHER_DIR}"
eval_cmd "mknod ${DISPATCHER_DIR}/99-dresden-schulen c 0 0"
eval_cmd "ls -l ${DISPATCHER_DIR}/"
eval_cmd "file ${DISPATCHER_DIR}/*"
