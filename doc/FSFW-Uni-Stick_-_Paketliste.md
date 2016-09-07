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
> Nach einigen Trial&Error-Versuchen Programmnamen von Hand in die Liste zu schreiben, wobei sich immerwieder gemeine Schreibfehler einschlichen, schuf eine grafische Sofwarepaketverwaltung (synaptic) abhilfe. Leider fiel es nun schwer herauszubekommen welche der ca. 2000 Programmpakete nun die tatsächlich gewünschten waren und welche nur automatisch zur Erfüllung von Paketabhängigkeiten mitinstalliert wurden. *apt-mark* und *aptitude* sorgten für Abhilfe.
> 
> Also einfach
> 
> 1. Die gewünschten Pakete in `aptitude` installieren (sie werden dann automatisch als "*manuell installiert*" markiert)
> 2. Die als *manuell installierten* Pakete mit `apt-mark showmanual > meine_Paketliste.list` exportieren


##  Paketliste  -- TODO: wieder hübsch gliedern

- :x:  acpid
- :x:  akonadiconsole
- :x:  asymptote
- :x:  audacity
- :x:  blender
- :x:  blogilo
- :x:  bridge-utils
- :x:  brltty
- :x:  brltty-espeak
- :x:  brltty-x11
- :x:  calibre
- :x:  celestia
- :x:  cellwriter
- :x:  chemical-mime-data
- :x:  comparepdf
- :x:  console-braille
- :x:  context
- :x:  create-resources
- :x:  cryptsetup
- :x:  cscope
- :x:  darktable
- :x:  dblatex
- :x:  debconf-kde-helper
- :x:  debian-faq
- :x:  dia
- :x:  diffpdf
- :x:  digikam
- :x:  digikam-doc
- :x:  discover
- :x:  dkms
- :x:  doc-debian
- :x:  docutils-common
- :x:  doxygen-doc
- :x:  doxygen-gui
- :x:  doxygen-latex
- :x:  dselect
- :x:  dvipng
- :x:  ebook-speaker
- :x:  ebtables
- :x:  eclipse
- :x:  eclipse-cdt
- :x:  eclipse-eclox
- :x:  eclipse-egit
- :x:  eflite
- :x:  enigmail
- :x:  ethtool
- :x:  fbset
- :x:  firefox-esr-l10n-de
- :x:  firmware-b43-installer
- :x:  firmware-iwlwifi
- :x:  firmware-linux-free
- :x:  fonts-mathjax-extras
- :x:  fonts-stix
- :x:  freecad
- :x:  freecad-doc
- :x:  gdb-doc
- :x:  geany
- :x:  geany-plugin-addons
- :x:  geany-plugin-doc
- :x:  geany-plugin-gendoc
- :x:  geany-plugin-latex
- :x:  geany-plugin-markdown
- :x:  geany-plugin-pairtaghighlighter
- :x:  geany-plugin-pg
- :x:  geany-plugin-prettyprinter
- :x:  geany-plugin-spellcheck
- :x:  geany-plugin-vc
- :x:  geda
- :x:  geda-examples
- :x:  geda-gsymcheck
- :x:  geeqie
- :x:  geogebra
- :x:  geogebra-kde
- :x:  gimp-dcraw
- :x:  git
- :x:  git-doc
- :x:  gitg
- :x:  gnome-accessibility-themes
- :x:  gnome-orca
- :x:  gnuplot
- :x:  gnuplot-doc
- :x:  gocr
- :x:  goldendict
- :x:  goldendict-wordnet
- :x:  graphviz
- :x:  graphviz-doc
- :x:  hp-ppd
- :x:  htdig
- :x:  htop
- :x:  hyphen-de
- :x:  icc-profiles-free
- :x:  icedove-l10n-de
- :x:  iceweasel-l10n-de
- :x:  installation-report
- :x:  ipython3
- :x:  ipython3-qtconsole
- :x:  irqbalance
- :x:  jabref
- :x:  jabref-plugin-oo
- :x:  kaddressbook-mobile
- :x:  kalarm
- :x:  kalzium
- :x:  kbibtex
- :x:  kde-config-cddb
- :x:  kde-standard
- :x:  kdeaccessibility
- :x:  kdenlive
- :x:  kdepim
- :x:  kdepim-mobile
- :x:  kicad
- :x:  kicad-doc-de
- :x:  kile
- :x:  kile-doc
- :x:  kile-l10n
- :x:  kjots
- :x:  klatexformula
- :x:  kleopatra
- :x:  kmail-mobile
- :x:  kmplot
- :x:  knode
- :x:  konsolekalendar
- :x:  kontact
- :x:  korganizer-mobile
- :x:  ktimetracker
- :x:  kvkbd
- :x:  kwordquiz
- :x:  latex2html
- :x:  libatm1
- :x:  libjs-mathjax-doc
- :x:  libreoffice-help-de
- :x:  lilypond
- :x:  live-boot-doc
- :x:  live-build
- :x:  live-config-doc
- :x:  lsdvd
- :x:  lshw
- :x:  lsof
- :x:  mc
- :x:  meld
- :x:  most
- :x:  mumble
- :x:  mumble-server
- :x:  mythes-de
- :x:  mythes-de-ch
- :x:  nano
- :x:  normalize-audio
- :x:  notes-mobile
- :x:  ocrfeeder
- :x:  octave
- :x:  octave-control
- :x:  pandoc
- :x:  pandoc-citeproc
- :x:  pdfgrep
- :x:  pdfmod
- :x:  pdfresurrect
- :x:  pdftk
- :x:  pidgin
- :x:  pidgin-encryption
- :x:  pidgin-openpgp
- :x:  pidgin-otr
- :x:  pitivi
- :x:  plasma-netbook
- :x:  pm-utils
- :x:  postgresql
- :x:  python-gnuplot
- :x:  python-numpy-doc
- :x:  python3-dev
- :x:  python3-matplotlib
- :x:  python3-numpy
- :x:  python3-pip
- :x:  python3-scipy
- :x:  qemu-kvm
- :x:  qtoctave
- :x:  r-base
- :x:  r-doc-info
- :x:  rawtherapee
- :x:  rfkill
- :x:  scratch
- :x:  screen
- :x:  scribus
- :x:  scribus-template
- :x:  scrot
- :x:  silversearcher-ag
- :x:  skanlite
- :x:  sozi
- :x:  sqlite3
- :x:  sqlitebrowser
- :x:  squashfs-tools
- :x:  ssh-askpass
- :x:  sshfs
- :x:  stellarium
- :x:  sweethome3d
- :x:  sweethome3d-furniture-editor
- :x:  sweethome3d-textures-editor
- :x:  swi-prolog
- :x:  swi-prolog-doc
- :x:  swi-prolog-java
- :x:  swi-prolog-odbc
- :x:  task-german
- :x:  task-german-desktop
- :x:  task-german-kde-desktop
- :x:  task-kde-desktop
- :x:  task-laptop
- :x:  tasks-mobile
- :x:  tesseract-ocr
- :x:  tesseract-ocr-deu
- :x:  tex4ht
- :x:  texlive-fonts-recommended
- :x:  texlive-latex-extra
- :x:  texlive-luatex
- :x:  texlive-xetex
- :x:  texstudio
- :x:  traceroute
- :x:  transcriber
- :x:  udisks
- :x:  unixodbc
- :x:  vbetool
- :x:  vim-doc
- :x:  vim-gtk
- :x:  vim-scripts
- :x:  vimhelp-de
- :x:  virt-manager
- :x:  virtualbox
- :x:  virtualbox-qt
- :x:  winff-doc
- :x:  winff-qt
- :x:  wireless-tools
- :x:  wireshark
- :x:  wireshark-doc
- :x:  xfce4-goodies
- :x:  xournal
- :x:  yasr
- :x:  zim

##  live  -- System Pakete werden fürs Live-System benöttigt

- :x:  live-boot 
- :x:  live-config
- :x:  live-config-systemd
