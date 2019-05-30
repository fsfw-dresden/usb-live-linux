#!/bin/bash
. "`dirname "${0}"`/functions.sh"
cd_repo_root

BUILD_VARIANT=$(readlink variants/active); BUILD_VARIANT=${BUILD_VARIANT%/}
echo "Live-Stick ${0} ${BUILD_VARIANT}" 
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

DOC_PATH=usr/local/share/doc/FSFW-Dresden
mkdir -pv config/includes.chroot/${DOC_PATH}/stick-doku
rsync -avP doc/html/ config/includes.chroot/${DOC_PATH}/stick-doku/
rsync -vaih FSFW-Material/ config/includes.chroot/${DOC_PATH}/

# Hinweis: Zur besseren Sichtbarkeit der LaTeX-Vorlagen leben diese seit Mai 2018 in einem eigenen Repo:
# <https://github.com/fsfw-dresden/latex-vorlagen>.
git submodule update --init --recursive
rsync -avP --exclude=.git* doc/latex-vorlagen/ config/includes.chroot/${DOC_PATH}/latex-vorlage

echo "FSFW Doku-Erstellung und Verteilung fertig."

