#!/bin/sh

repo_root() {
        git rev-parse --show-toplevel
}

cd_repo_root() {
        echo "current dir: " $(pwd)
        cd $(dirname "${0}")
        echo "now at $(pwd), finding repo root"
        ROOT=$(repo_root)
        cd ${ROOT}
}

check_program_exists() {
        [ ! -z $(command -v "${@}") ] && return 0
        echo "Program '${@}' does NOT exist in path, try # apt install ${@}"
        return 1
}


variant_path_set() {
    BUILD_PATH=$PWD

    echo "FSFW-Uni-Stick build PATH:  \$PWD == $PWD "
    echo "FSFW-Uni-Stick ROOT PATH:   \$(repo_root) == $(repo_root) "

    VARIANT_PATH_DEFAULT="$(repo_root)/variants"
    FSFW_UNI_STICK_VARIANT_DEFAULT=$(basename $(readlink ${VARIANT_PATH_DEFAULT}/default))

    FSFW_UNI_STICK_VARIANT=$(basename "$1")
    VARIANT_PATH=$(dirname "$1")


    if [[ ${VARIANT_PATH} == "." ]]; then
	    VARIANT_PATH=${VARIANT_PATH_DEFAULT}
	    echo "FSFW-Uni-Stick config PATH: \${VARIANT_PATH} == ${VARIANT_PATH} "
	else
	    echo "FSFW-Uni-Stick config PATH: \${VARIANT_PATH} == ${VARIANT_PATH} "

    fi

    if [[ -z ${FSFW_UNI_STICK_VARIANT} ]]; then
	    FSFW_UNI_STICK_VARIANT=${FSFW_UNI_STICK_VARIANT_DEFAULT}
	    echo "FSFW-Uni-Stick config:      \${FSFW_UNI_STICK_VARIANT} == ${FSFW_UNI_STICK_VARIANT} "
	else
	    echo "FSFW-Uni-Stick config:      \${FSFW_UNI_STICK_VARIANT} == ${FSFW_UNI_STICK_VARIANT} "
    fi


    # Test ob Verzeichnis existiert

    if [[ -d "${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT}" ]]; then
	    echo "FSFW-Uni-Stick config:      ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT} -- wird verwendet"
	    export VARIANT_PATH
	    export FSFW_UNI_STICK_VARIANT
	else
	    echo "FSFW-Uni-Stick config:      ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT} -- existiert nicht"
	    exit
    fi
}
