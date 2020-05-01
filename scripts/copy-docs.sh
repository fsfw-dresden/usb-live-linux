#!/bin/bash
. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$1
[ -n "${BUILD_VARIANT}" ] || { print_warn "ERROR no BUILD_VARIANT parameter given" >&2 && exit 1; }
DOC_PATH=${2:-/usr/local/share/doc/FSFW}
echo "Live-Stick ${0} ${BUILD_VARIANT} ${DOC_PATH}"
echo "FSFW Material/Doku bauen und verteilen"

check_program_exists pandoc || exit 1

# fall back to default doc folder if variant has none
[ -d variants/${BUILD_VARIANT}/doc/src ] && MD_PATH="variants/${BUILD_VARIANT}/doc/src" || MD_PATH="doc/src"

LIST_MD=(${MD_PATH}/*.md)
for FILE in ${LIST_MD[@]} ;
do
    TARGETFILE="${FILE##*/}"
    TARGETFILE="doc/html/${TARGETFILE%%.md}.html"

    pandoc --standalone --template doc/src/fsfw-template.html ${FILE} -o $TARGETFILE
    python3 scripts/convert-md-links.py "$TARGETFILE"

    echo "Datei geschrieben:" $TARGETFILE
done

mkdir -pv config/includes.chroot/${DOC_PATH#/}
rsync -aP doc/html/ config/includes.chroot/${DOC_PATH#/}/

echo "FSFW Doku-Erstellung und Verteilung fertig."

