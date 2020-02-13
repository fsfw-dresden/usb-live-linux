#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
#	VERSION: 0.0.5
#
#	CREATED: 2017-09-13
#      REVISION: 2019-07-03
#
# erstellten der user Konfiguration aus Vorlagen von ${VARIANT_PATH}/${BUILD_VARIANT}/user_config/src/...".
#

echo "user_config.sh - FSFW-Uni-Stick: variant PATH = ${VARIANT_PATH}  -- variant = ${BUILD_VARIANT} "
REPO_ROOT=$(git rev-parse --show-toplevel)


echo "../tools/fsfw-user_config.sh ${FSFW_UNI_STICK_CONFIG} ausführen "
${REPO_ROOT}/tools/fsfw-user_config.sh


# z.B. spezielle Doku bzw. abweichende Optionen je nach Desktop

FSFW_DOC_PATH=usr/local/share/doc/FSFW-Dresden

if [ ! -d config/includes.chroot/${FSFW_DOC_PATH}/stick-doku ]; then
	 mkdir -pv config/includes.chroot/${FSFW_DOC_PATH}/stick-doku
fi 

rsync -avP ${REPO_ROOT}/doc/html/ config/includes.chroot/${FSFW_DOC_PATH}/stick-doku
rsync -avP ${VARIANT_PATH}/${BUILD_VARIANT}/doc/html/ config/includes.chroot/${FSFW_DOC_PATH}/stick-doku

rsync -avP ${REPO_ROOT}/doc/FSFW-Material/ config/includes.chroot/${FSFW_DOC_PATH}/

# TODO: *.html  link --> config/includes.chroot/var/www/ ?

ln -sv /$FSFW_DOC_PATH config/includes.chroot/etc/skel/FSFW-Material


# doc/latex-vorlage  übernehmen

# Hinweis: Zur besseren Sichtbarkeit der LaTeX-Vorlagen leben diese seit Mai 2018 in einem eigenen Repo:
# <https://github.com/fsfw-dresden/latex-vorlagen>.
git submodule update --init --recursive
rsync -avP --exclude=.git* ${REPO_ROOT}/doc/latex-vorlagen/ config/includes.chroot/${FSFW_DOC_PATH}/latex-vorlage

echo "FSFW Doku-Erstellung und Verteilung fertig."
