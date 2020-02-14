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
    BUILD_VARIANT_DEFAULT=$(basename $(readlink ${VARIANT_PATH_DEFAULT}/default))

    BUILD_VARIANT=$(basename "$1")
    VARIANT_PATH=$(dirname "$1")


    if [[ ${VARIANT_PATH} == "." ]]; then
	    VARIANT_PATH=${VARIANT_PATH_DEFAULT}
	    echo "FSFW-Uni-Stick config PATH: \${VARIANT_PATH} == ${VARIANT_PATH} "
	else
	    echo "FSFW-Uni-Stick config PATH: \${VARIANT_PATH} == ${VARIANT_PATH} "

    fi

    if [[ -z ${BUILD_VARIANT} ]]; then
	    BUILD_VARIANT=${BUILD_VARIANT_DEFAULT}
	    echo "FSFW-Uni-Stick config:      \${BUILD_VARIANT} == ${BUILD_VARIANT} "
	else
	    echo "FSFW-Uni-Stick config:      \${BUILD_VARIANT} == ${BUILD_VARIANT} "
    fi


    # Test ob Verzeichnis existiert

    if [[ -d "${VARIANT_PATH}/${BUILD_VARIANT}" ]]; then
	    echo "FSFW-Uni-Stick config:      ${VARIANT_PATH}/${BUILD_VARIANT} -- wird verwendet"
	    export VARIANT_PATH
	    export BUILD_VARIANT
	else
	    echo "FSFW-Uni-Stick config:      ${VARIANT_PATH}/${BUILD_VARIANT} -- existiert nicht"
	    exit
    fi
}


variant_config_set() {
    rm ./auto/config
    ln -s ${VARIANT_PATH}/${BUILD_VARIANT}/config ./auto/config
    echo " ${VARIANT_PATH}/${BUILD_VARIANT}/config  aktiviert "
}

variant_system_config_sync() {
    echo " system_config variant = ${BUILD_VARIANT} aktualliesieren "
    rsync -avP ${VARIANT_PATH}/${BUILD_VARIANT}/system_config/ config
    echo " system_config  aktuallisiert fertig."
}


check_program_installed() {
	for paket in ${@}
	do
	    if ! dpkg --list | grep -qF "ii  ${paket} " ; then
		paket_not_installed="${paket_not_installed} ${paket}"
	    fi
	done

	if [ -n "${paket_not_installed}" ]; then
	    echo "Paket >> ${paket_not_installed} << ist nicht installiert!"
            echo "Installieren erfolgt mit"
            echo "   (sudo) apt install ${paket_not_installed} "
	    echo " Möchten sie jetzt mit der Installation fortfahren geben sie >> y << ein und die Eingabetaste, Abbruch mit jeder anderen Taste ... : "
	    read TASTE
		if [ ! "$TASTE" = "y" ] ; then
		    echo "Skript wird abgebrochen "
		    exit 1
		fi

	    sudo apt install ${paket_not_installed}

	fi

}
