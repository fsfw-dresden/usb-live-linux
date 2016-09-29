[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)


# Paketliste für FSFW UNI Stick (USB-Live-Stick) 

>  zum automatisierten erstellen der Paketlisten aus dieser Doku Paketliste
>  ` $ auto/paketliste `   --  im live-build-Verzeichnis ausführen
>
>
> ##  Syntax für die Paketlisten
>
> #### Programme die auf dem Stick sind / sein sollen (...list.chroot)
>
> - ###  Virtuelle Paketliste  - Task List
>
>     __vor und hinter dem Paket- und Listennamen zwei Leerzeichen verwenden__
>
> - :x:  Paket ausgewählt  -- kurze Info / Beschreibung (wofür braucht man das ?)
>	- Info zum Programm
>	  - Beschreibung / Erklärungen
>
> - :o:  Paket nicht ausgewählt
>
> - :+1:  Paket vorschlag - Abstimmung im Plenum (reguläre Treffen) folgt 	-- Beschreibung
>
> - :o: :-1:  Paket derzeit nicht benutzt weil 	-- Beschreibung
>
> #### Programme die auf dem Stick als Paket verfügbar sind, aber noch nicht installiert sind (...list.binary)
>
> - [x]  Programm (Paket) auf dem Stick verfügbar 
>
> - [ ]  Programm (Paket) vorschlag 
>
[//]: # (Carsten: Ich verstehe noch nicht ganz den Sinn, Pakete auf dem Stick vorzuhalten, aber sie noch nicht zu installieren)
[//]: # (Gerd: Firmware, Treiber z.B. Grafik Nvidia gibt es in verschiedenen varianten und können untereinander kollidieren, leichteres anpassen auch ohne Netz - nur im "persistence mode" bleiben die geänderten Einstellung erhalten )
>
> #### Anmerkungen / Fragen / Kommentare
> - am besten als Markdown-Kommentare in den Quelltext
> - Syntax:
>  `[//]: # (Name: Das ist ein Markdown-Kommentar und wird nicht mit gerendert.)`
>
> - Siehe auch den Quelltext dieser Datei
> - Zur lokalen Vorschau eignet sich z.B. [https://github.com/joeyespo/grip](https://github.com/joeyespo/grip)
> 
> ## Wie diese Liste erstellt wurde...
> 
> Nach einigen Trial&Error-Versuchen Programmnamen von Hand in die Liste zu schreiben, wobei sich immerwieder gemeine Schreibfehler einschlichen, schuf eine grafische Sofwarepaketverwaltung (synaptic) abhilfe. Leider fiel es nun schwer herauszubekommen welche der ca. 2000 Programmpakete nun die tatsächlich gewünschten waren und welche nur automatisch zur Erfüllung von Paketabhängigkeiten mitinstalliert wurden. *apt-mark* und *aptitude* sorgten hier nun für Abhilfe.
> 
> Also einfach
> 
> 1. Die als *manuell installierten* Pakete mit `apt-mark showmanual > meine_Paketliste.alt.list` exportieren
> 2. Die gewünschten Pakete in `aptitude` installieren (sie werden dann automatisch als "*manuell installiert*" markiert)
> 3. Die als *manuell installierten* Pakete mit `apt-mark showmanual > meine_Paketliste.neu.list` exportieren
> 3. Alte und neue Paketliste abgleichen und Änderungen übernehmen (Dateivergleicher wie *meld*, *comm* oder *diff* helfen hierbei).

> TODO: Durchsehen und ggf. in andere Listen über nehmen.

arduino
arduino-mk
avrdude-doc
avrprog
biber
dasher
# dblatex
debconf-kde-helper
debian-faq
dia
diffpdf
digikam
digikam-doc
discover
dkms
# doc-debian
docutils-common
doxygen-doc
doxygen-gui
doxygen-latex
ebook-speaker
ebtables
eclipse
eclipse-cdt
eclipse-eclox
# eclipse-egit
eflite
# espeakup
ethtool
# fbset
filelight
firmware-iwlwifi
firmware-linux-free
flite
focuswriter
fonts-mathjax-extras
fonts-stix
fraqtive
freecad
freecad-doc
freetts
fritzing
gcc-doc
gdb-doc
geany
geany-plugin-addons
geany-plugin-doc
geany-plugin-gendoc
geany-plugin-latex
geany-plugin-markdown
geany-plugin-pairtaghighlighter
geany-plugin-pg
geany-plugin-prettyprinter
geany-plugin-spellcheck
geany-plugin-vc
geda
geda-examples
geda-gsymcheck
gespeaker
gimp-dcraw
git-doc
gitg
gnome-accessibility-themes
gnome-orca
gnuplot-doc
gocr
goldendict
goldendict-wordnet
gosmore
gpart
gparted
graphviz
graphviz-doc
gstreamer0.10-pocketsphinx
hp-ppd
htdig
htop
hyphen-de
icc-profiles-free
ipython3-qtconsole
irqbalance
jabref
jabref-plugin-oo
josm
# kalarm
# kamoso
kbibtex
kdeaccessibility
kde-config-cddb
kdeconnect
kdenlive
kdepim
kde-standard
kicad
kicad-doc-de
kile
kile-doc
kile-l10n
kio-mtp
kjots
klatexformula
kleopatra
klettres
kmplot
knode
krecipes
krecipes-doc
kteatime
ktimetracker
ktouch
kvkbd
latex2html
lib32ncurses5
lib32ncursesw5
lib32stdc++6
lib32z1
libatm1
libjs-mathjax-doc
libttspico-utils
logisim
lsof
man2html-base
marble
maven
maxima-doc
mbrola
mbrola-de4
mbrola-de5
mbrola-de6
mbrola-de7
mbrola-us1
mbrola-us2
mbrola-us3
openteacher
pandoc
pandoc-citeproc
parley
pcb
pdfgrep
pdfmod
pdfresurrect
pdftk
php5
php5-xdebug
phpunit
pitivi
plasma-netbook
pm-utils
pocketsphinx
postgresql
pspp
python3-dev
python3-matplotlib
python3-numpy
python3-pip
python3-scipy
python-gnuplot
python-numpy-doc
qelectrotech
qemu-kvm
qtcreator
# qtgstreamer-plugins
qtoctave
r-base
r-doc-info
rfkill
routino
scratch
stellarium
subtitlecomposer
swi-prolog
swi-prolog-doc
swi-prolog-java
swi-prolog-odbc
tesseract-ocr
tesseract-ocr-deu
testdisk
tex4ht
traceroute
transcriber
uisp
unixodbc
usbprog
usbprog-gui
vbetool
vim-doc
virt-manager
virtualbox
virtualbox-qt
# wayv
winff-doc
winff-qt
wireshark
wireshark-doc
# xfce4-goodies
