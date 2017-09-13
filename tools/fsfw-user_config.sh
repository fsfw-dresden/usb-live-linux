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
# und schreibt sie nach "../config/${FSFW_UNI_STICK_CONFIG}/user_config/..."
#

FSFW_UNI_STICK_CONFIG=$1
echo "fsfw-user_config.sh  FSFW-Uni-Stick config: ${FSFW_UNI_STICK_CONFIG} " 


# aktuallisieren der ../config/${FSFW_UNI_STICK_CONFIG}/user_config/..
# 
echo "FSFW "user" config verteilen"

rsync -avP --exclude=aux-files/ ../doc/src_fsfw-user_config/ ../config/${FSFW_UNI_STICK_CONFIG}/user_config

echo "FSFW "user" configuration fertig."

#
echo "FSFW Material/Doku bauen und verteilen"

# TODO: allgemeine Doku zu Progammen oder Funkionen des Live Systems --> doku_create.sh

dlist_md=(../doc/src/*.md)

for f in ${dlist_md[@]##*/} ; 
   do
    TARGETFILE="../doc/html/${f%%.md}.html"

# TODO: Fehler, falls Paket pandoc nicht installiert ist -> Programmverfügbarkeit vorher testen
    cmd="pandoc --standalone --template ../doc/build-script/fsfw-template.html ../doc/src/${f} -o $TARGETFILE"

    # for debugging:
    # echo $cmd
    
    eval $cmd

    # in the markdown docs there are markdown link targets (to play nicely with github)
    # now its time to convert them

    python3 ../tools/convert-md-links.py "$TARGETFILE"
    
    echo "Datei geschrieben:" $TARGETFILE
done


# TODO: *.hlml  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/

if [ ! -d ../config/${FSFW_UNI_STICK_CONFIG}/user_config/FSFW-Material/stick-doku/ ]; then
	 mkdir -p ../config/${FSFW_UNI_STICK_CONFIG}/user_config/FSFW-Material/stick-doku/
	 echo " ../config/${FSFW_UNI_STICK_CONFIG}/user_configFSFW-Material/stick-doku/ erstellt"
fi 

rsync -avP ../doc/html/ ../config/${FSFW_UNI_STICK_CONFIG}/user_config/FSFW-Material/stick-doku

# doc/latex-vorlage  übernehmen

rsync -avP ../doc/latex-vorlage ../config/${FSFW_UNI_STICK_CONFIG}/user_config/FSFW-Material

echo "FSFW Doku-Erstellung und Verteilung fertig."


