#!/bin/sh

# Arguments:
# num_repetitions
# list of files
link_wallpaper() {
        # Symlinks in this folder will be shown as desktop background
        # and cycled through daily
        DEST=/usr/local/share/backgrounds
        mkdir -pv $DEST

        # First parameter may be a number
        case $1 in
                [0-9]+) REPETITIONS=$1
                        shift;;
                *)
                        REPETITIONS=1
                        ;;
        esac

        for IMAGE in "${@}"
        do
                IMAGE_EXT=${IMAGE##*.}
                IMAGE_NAME=$(basename --suffix=".${IMAGE_EXT}" "${IMAGE}")

                NUM=1
                while [ ${NUM} -le ${REPETITIONS} ]
                do
                        [ ${NUM} -gt 1 ] && SUFFIX=".${NUM}" || SUFFIX=
                        LINK=$DEST/${IMAGE_NAME}${SUFFIX}.${IMAGE_EXT}
                        ln -sv "${IMAGE}" "${LINK}"
                        NUM=$((NUM + 1))
                done
        done
}
