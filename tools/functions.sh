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

    echo "FSFW-Uni-Stick build PATH: $PWD "

    CONFIG_PATH_DEFAULT="../config"
    FSFW_UNI_STICK_CONFIG_DEFAULT=$(basename "$(readlink ${CONFIG_PATH_DEFAULT}/default)")

    FSFW_UNI_STICK_CONFIG=$(basename "$1")
    CONFIG_PATH=$(dirname "$1")

    echo "FSFW-Uni-Stick config PATH: ${CONFIG_PATH} " 
    echo "FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 


    if [[ ${CONFIG_PATH} == "." ]]; then
	CONFIG_PATH=${CONFIG_PATH_DEFAULT}
	echo "FSFW-Uni-Stick config PATH: ${CONFIG_PATH} " 
    fi

    if [[ -z ${FSFW_UNI_STICK_CONFIG} ]]; then
	FSFW_UNI_STICK_CONFIG=${FSFW_UNI_STICK_CONFIG_DEFAULT}
	echo "FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 
    fi

    # Test ob Verzeichnis existiert

    if [[ -d "${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG}" ]]; then
	    echo "FSFW-Uni-Stick config: ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG} -- wird verwendet"
	else
	    echo "FSFW-Uni-Stick config: ${CONFIG_PATH}/${FSFW_UNI_STICK_CONFIG} -- existiert nicht"
	    exit
    fi
}
