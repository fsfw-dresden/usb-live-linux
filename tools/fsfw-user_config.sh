#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# erstellten der user Konfiguration aus doc/src_user-config/*  
# und schreibt sie nach "config/includes.chroot/home/user/" und "config/includes.chroot/etc/..."
#
#

# git-versionsnummer / link --> config/includes.chroot/home/user/.version_fsfw-uni-stick
#
echo " FSFW_UNI_STICK_VERSION = "$(echo "$(../tools/calc-version-number.sh)")" " > config/includes.chroot/home/user/.version_fsfw-uni-stick
echo " git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/home/user/.version_fsfw-uni-stick

echo "FSFW "user" config verteilen"

rsync -avP --delete ../doc/src_fsfw-user_config/ config/includes.chroot/home/user

echo "FSFW "user" configuration fertig."

#
echo "FSFW Material/Doku bauen und verteilen"

# allgemeine Doku zu Progammen oder Funkionen des Live Systems --> doku_create.sh

#### erstellt von Carsten / angepasst gerd -->

dlist_md=(../doc/src/*.md)

for f in ${dlist_md[@]##*/} ; 
   do
    TARGETFILE="../doc/html/${f%%.md}.html"

# TODO: Fehler! fals Paket pandoc nicht installiert ist -- Programmverfügbarkeit vorher testen
    cmd="pandoc --standalone --template ../doc/build-script/fsfw-template.html ${dlist_md} -o $TARGETFILE"

    # for debugging:
    # echo $cmd
    eval $cmd

    # in the markdown docs there are markdown link targets (to play nicely with github)
    # now its time to convert them

    perl -p -i -e 's/\.md">/\.html">/g' $TARGETFILE
    
    echo "Datei geschrieben:" $TARGETFILE
done

## erstellt Carsten <--


# TODO: *.hlml  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/

if [ ! -d config/includes.chroot/home/user/FSFW-Material/stick-doku/ ]; then
	 mkdir -p config/includes.chroot/home/user/FSFW-Material/stick-doku/
	 echo " config/includes.chroot/home/user/FSFW-Material/stick-doku/ erstellt"
fi 

rsync -avP --delete ../doc/html/ config/includes.chroot/home/user/FSFW-Material/stick-doku

# doc/latex-vorlage  übernehmen

rsync -avP --delete ../doc/latex-vorlage config/includes.chroot/home/user/FSFW-Material

echo "FSFW Doku-Erstellung und Verteilung fertig."


