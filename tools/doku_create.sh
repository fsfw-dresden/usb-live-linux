#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2016-10-21
#
# Doku bauen und verteilen

echo " "
echo "Doku bauen und verteilen"

#### erstellt von Carsten -->

cd ../doc/src/

for f in *.md ;
    do

    TARGETFILE="../html/${f%%.md}.html"

# TODO: Fehler! fals Paket pandoc nicht installiert ist -- Programmverfügbarkeit vorher testen
    cmd="pandoc --standalone --template $ORIGPATH/../doc/build-script/fsfw-template.html ${f} -o $TARGETFILE"

    # for debugging:
    # echo $cmd
    eval $cmd

    # in the markdown docs there are markdown link targets (to play nicely with github)
    # now its time to convert them

    perl -p -i -e 's/\.md">/\.html">/g' $TARGETFILE
    
    echo "Datei geschrieben:" $TARGETFILE
done

## erstellt Carsten <--

cd ${OLDPWD}

# TODO: *.hlml  --> ../../FSFW-Uni-Stick/config/includes.chroot/var/www/

if [ ! -d config/includes.chroot/home/user/FSFW-Material/stick-doku/ ]; then
	 mkdir -p config/includes.chroot/home/user/FSFW-Material/stick-doku/
	 echo " config/includes.chroot/home/user/FSFW-Material/stick-doku/ erstellt"
fi 

rsync -avP --delete ../doc/html config/includes.chroot/home/user/FSFW-Material/stick-doku

echo "Doku-Erstellung und Verteilung fertig."

