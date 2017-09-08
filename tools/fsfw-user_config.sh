#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# erstellten der user Konfiguration aus doc/src_user-config/*  
# und schreibt sie nach "config/includes.chroot/etc/skel/" und "config/includes.chroot/etc/..."
#
#
# aufräumen ( ist ../home/user vorhanden wird die config nicht aus ../etc/skel übernommen)
  if [ -d config/includes.chroot/home/ ]; then
	 rm -R config/includes.chroot/home
	 echo " config/includes.chroot/home gelöscht"
  fi 

  if [ -d config/includes.chroot/etc/skel/ ]; then
	 rm -R config/includes.chroot/etc/skel/*
	 echo " löschen - config/includes.chroot/etc/skel/* "
  fi 

# git-versionsnummer / link --> config/includes.chroot/etc/skel/.version_fsfw-uni-stick
#
  if [ ! -d config/includes.chroot/etc/skel/ ]; then
	 mkdir -p config/includes.chroot/etc/skel/
	 echo " config/includes.chroot/etc/skel/ erstellt"
	else
	 rm config/includes.chroot/etc/skel/*
	 echo " löschen - config/includes.chroot/etc/skel/* "
  fi 

echo " FSFW_UNI_STICK_VERSION = "$(echo "$(../tools/calc-version-number.sh)")" " > config/includes.chroot/etc/skel/.version_fsfw-uni-stick
echo " git-revision = https://github.com/fsfw-dresden/usb-live-linux/tree/$(git rev-parse master)" >> config/includes.chroot/etc/skel/.version_fsfw-uni-stick

echo "FSFW "user" config verteilen"

rsync -avP --exclude=aux-files/ ../doc/src_fsfw-user_config/ config/includes.chroot/etc/skel 

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

if [ ! -d config/includes.chroot/etc/skel/FSFW-Material/stick-doku/ ]; then
	 mkdir -p config/includes.chroot/etc/skel/FSFW-Material/stick-doku/
	 echo " config/includes.chroot/etc/skel/FSFW-Material/stick-doku/ erstellt"
fi 

rsync -avP ../doc/html/ config/includes.chroot/etc/skel/FSFW-Material/stick-doku

# doc/latex-vorlage  übernehmen

rsync -avP ../doc/latex-vorlage config/includes.chroot/etc/skel/FSFW-Material

echo "FSFW Doku-Erstellung und Verteilung fertig."


