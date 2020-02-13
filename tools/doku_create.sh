#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
#	VERSION: 0.0.5
#
#	CREATED: 2016-10-21
#      REVISION: 2019-07-03
#
# Doku bauen und verteilen

echo "doku_create.sh - FSFW-Uni-Stick: variant PATH = ${VARIANT_PATH}  -- variant = ${BUILD_VARIANT} "
REPO_ROOT=$(git rev-parse --show-toplevel)

echo " "
echo "Doku bauen und verteilen"

# Hier allgemeine Doku zu Progammen oder Funkionen des Live Systems

echo "allgemeine Doku zu Programmen und zum Stick - Erstellung fertig."


echo "FSFW Material/Doku bauen "

# TODO: als Funkion nach --> functions.sh ??

if [ ! -d ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html ]; then
				 mkdir -p ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html
				 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html erstellt"
	else
				 echo " ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html vorhanden "
fi


LIST_MD=(${VARIANT_PATH}/${BUILD_VARIANT}/doc/src/*.md)
echo " LIST_MD = ${LIST_MD[@]##*/} "

for FILE in ${LIST_MD[@]##*/} ;
do
    TARGETFILE="${VARIANT_PATH}/${BUILD_VARIANT}/doc/html/${FILE%%.md}.html"

    pandoc --standalone --template ${REPO_ROOT}/doc/build-script/fsfw-template.html ${VARIANT_PATH}/${BUILD_VARIANT}/doc/src/${FILE} -o $TARGETFILE
    python3 ${REPO_ROOT}/tools/convert-md-links.py "$TARGETFILE"

    echo "Datei geschrieben:" $TARGETFILE
done

echo "FSFW Doku-Erstellung fertig."

