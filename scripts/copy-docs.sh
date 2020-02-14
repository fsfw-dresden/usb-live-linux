#!/bin/bash
. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
DOC_PATH=${1:-/usr/local/share/doc/FSFW}
echo "Live-Stick ${0} ${DOC_PATH} ${BUILD_VARIANT}" 
echo "FSFW Material/Doku bauen und verteilen"

check_program_exists pandoc || exit 1

LIST_MD=(variants/${BUILD_VARIANT}/doc/src/*.md)
for FILE in ${LIST_MD[@]##*/} ;
do
    TARGETFILE="doc/html/${FILE%%.md}.html"

    pandoc --standalone --template doc/src/fsfw-template.html variants/${BUILD_VARIANT}/doc/src/${FILE} -o $TARGETFILE
    python3 scripts/convert-md-links.py "$TARGETFILE"

    echo "Datei geschrieben:" $TARGETFILE
done

mkdir -pv config/includes.chroot/${DOC_PATH#/}
rsync -aP doc/html/ config/includes.chroot/${DOC_PATH#/}/

echo "FSFW Doku-Erstellung und Verteilung fertig."

