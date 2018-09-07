#!/bin/sh

cd_repo_root() {
        echo "current dir: " $(pwd)
        ROOT=$(git rev-parse --show-toplevel)
        cd "${ROOT}"
}

check_program_exists() {
        [ ! -z $(command -v "${@}") ] && return 0
        echo "Program '${@}' does NOT exist in path, try # apt install ${@}"
        return 1
}
