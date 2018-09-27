#!/bin/bash
. "`dirname "${0}"`/functions.sh"
cd_repo_root

FSFW_UNI_STICK_CONFIG=$1
echo "FSFW-Uni-Stick ${0} ${FSFW_UNI_STICK_CONFIG} " 
echo "FSFW Material/Doku bauen und verteilen"

check_program_exists pandoc || exit 1

LIST_MD=(variants/${FSFW_UNI_STICK_CONFIG}/doc/src/*.md)
for FILE in ${LIST_MD[@]##*/} ;
do
    TARGETFILE="doc/html/${FILE%%.md}.html"

    pandoc --standalone --template doc/src/fsfw-template.html variants/${FSFW_UNI_STICK_CONFIG}/doc/src/${FILE} -o $TARGETFILE
    python3 scripts/convert-md-links.py "$TARGETFILE"

    echo "Datei geschrieben:" $TARGETFILE
done

mkdir -pv config/includes.chroot/etc/skel/FSFW-Material/stick-doku
rsync -avP doc/html/ config/includes.chroot/etc/skel/FSFW-Material/stick-doku/

# Hinweis: Zur besseren Sichtbarkeit der LaTeX-Vorlagen leben diese seit Mai 2018 in einem eigenen Repo:
# <https://github.com/fsfw-dresden/latex-vorlagen>.
git submodule update --init --recursive
rsync -avP --exclude=.git* doc/latex-vorlagen/ config/includes.chroot/etc/skel/FSFW-Material/latex-vorlage

echo "FSFW Doku-Erstellung und Verteilung fertig."

