#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21 
#
#	VERSION: 0.0.3
#
#	CREATED: 2016-10-21
#      REVISION: 2017-09-13
#
# erstellten der user Konfiguration aus doc/src_fsfw-user_config/*  
# und schreibt sie nach "../config/includes.chroot/..."
#

FSFW_UNI_STICK_CONFIG=$1
echo "fsfw-user_config.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 

# TODO:  ${DISTRIBUTION}  jessie - stretch .... unterscheiden ??

# aktuallisieren der ../config/includes.chroot/etc/skel/..
# 
#echo "fsfw-user_config.sh - config verteilen"

#rsync -avP --exclude=aux-files/ ../doc/src_fsfw-user_config/ config/includes.chroot/etc/skel

#echo "fsfw-user_config.sh - configuration fertig."

#
echo "FSFW Material/Doku bauen und verteilen"

# TODO: allgemeine Doku zu Progammen oder Funkionen des Live Systems --> doku_create.sh

dlist_md=(../config/${FSFW_UNI_STICK_CONFIG}/doc/src/*.md)

for f in ${dlist_md[@]##*/} ; 
   do
    TARGETFILE="../doc/html/${f%%.md}.html"

# TODO: Fehler, falls Paket pandoc nicht installiert ist -> Programmverfügbarkeit vorher testen
    cmd="pandoc --standalone --template ../doc/build-script/fsfw-template.html ../config/${FSFW_UNI_STICK_CONFIG}/doc/src/${f} -o $TARGETFILE"

    # for debugging:
    # echo $cmd
    
    eval $cmd

    # in the markdown docs there are markdown link targets (to play nicely with github)
    # now its time to convert them

    python3 ../tools/convert-md-links.py "$TARGETFILE"
    
    echo "Datei geschrieben:" $TARGETFILE
done


# TODO: *.hlml  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/


if [ ! -d config/includes.chroot/etc/skel/FSFW-Material/stick-doku/ ]; then
	 mkdir -p config/includes.chroot/etc/skel/FSFW-Material/stick-doku/
	 echo " config/includes.chroot/etc/skel/FSFW-Material/stick-doku/ erstellt"
fi 

rsync -avP ../doc/html/ config/includes.chroot/etc/skel/FSFW-Material/stick-doku

# doc/latex-vorlage  übernehmen

# Hinweis: Zur besseren Sichtbarkeit der LaTeX-Vorlagen leben diese seit Mai 2018 in einem eigenen Repo: 
# <https://github.com/fsfw-dresden/latex-vorlagen>.

git submodule update --init --recursive

rsync -avP --exclude=.git* ../doc/latex-vorlagen/ config/includes.chroot/etc/skel/FSFW-Material/latex-vorlage

echo "FSFW Doku-Erstellung und Verteilung fertig."

