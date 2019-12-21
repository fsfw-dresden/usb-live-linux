#!/bin/sh

# die on error
set -e

COLOR_GREEN="\e[1;32m"
COLOR_ORANGE="\e[1;33m"
COLOR_CYAN="\e[1;36m"
COLOR_RED="\e[1;31m"
COLOR_OFF="\e[0m"

repo_root() {
        git rev-parse --show-toplevel
}

cd_repo_root() {
        echo "current dir: " $(pwd)
        cd $(dirname $(realpath "${0}"))
        echo "now at $(pwd), finding repo root"
        ROOT=$(repo_root)
        cd "${ROOT}"
}

check_program_exists() {
        [ ! -z $(command -v "${@}") ] && return 0
        echo "Program '${@}' does NOT exist in path, try # apt install ${@}"
        return 1
}

print_info() {
    echo -e "[ ℹ️  ] ${COLOR_CYAN}${@}${COLOR_OFF}"
}

print_warn() {
    echo -e "[ ⚠️  ] ${COLOR_RED}${@}${COLOR_OFF}"
}
