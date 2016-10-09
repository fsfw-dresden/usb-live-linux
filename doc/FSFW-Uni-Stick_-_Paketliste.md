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


##  Desktop

- :o:  task-desktop  -- Grafische Desktop Umgebung - Progamm Sammlung
- :o:  desktop-base  -- Allgemeine Dateien für den Debian-Desktop - schlägt gnome vor

- ###  task-kde-desktop  -- KDE Desktop Umgebung

- :x:  kdm  --		KDE-Displaymanager für X11

- ###  kde-standard

- :-1:  akregator  --	RSS/Atom-Feed-Aggregator 
- :-1:  ark  --		Archiv-Werkzeug 
- :-1:  dragonplayer  --	Einfacher Videoabspieler 
- :-1:  gwenview  --	Bildbetrachter 
- :-1:  juk  --		Jukebox und Musikabspieler 
- :-1:  kaddressbook  --	Adressbuch- und Kontaktdatenverwaltung 
- :x:  kate  --		Leistungsstarker Texteditor 
- :-1:  kcalc  --	Einfacher wissenschaftlicher Taschenrechner 
- :-1:  khelpcenter4  --	Hilfezentrum 
- :-1:  kmail  --	Vollständiger grafischer E-Mail-Client
[//]: # (Carsten: bei kmail wäre zu überlegen, ob man es nicht weglässt. icedove (bzw. vorzugsweise thunderbird) ist ohnehin gesetzt. Alles weitere verwirrt nur.)
- :-1:  kmix  --		Lautstärkeregler und Mischer 
- :-1:  knotes  --	Programm für Haftnotizen (sticky notes) 
- :-1:  kopete  --	Instant-Messaging- und Chat-Anwendung 
- :-1:  korganizer  --	Kalender und persönliche Terminverwaltung 
- :-1:  kscreensaver  --	Zusätzliche Bildschirmschoner für KScreenSaver 
- :-1:  ksnapshot  --	Werkzeug für die Erstellung von Bildschirmfotos 
- :-1:  kwalletmanager  -- Sichere Passwortverwaltung 
- :-1:  okular  --	Universal-Dokumentenbetrachter 
- :-1:  polkit-kde-1  --	KDE-Dialoge für PolicyKit 
- :-1:  sweeper  --	Löschen von Verlauf und temporären Dateien 
- :-1:  freespacenotifier  -- KDE-Modul zur Benachrichtigung bei Platzmangel 
- :-1:  konq-plugins  --	Erweiterungen für Konqueror, den KDE-Datei-/Web-/Dokumenten-Browser 
- :x:  kdeplasma-addons  -- Plasma-Erweiterungen 
- :x:  kde-plasma-desktop  -- KDE Plasma Desktop und eine minimale Auswahl an Anwendungen - oder ...netbook
- :x:  kde-plasma-netbook  -- KDE Plasma Netbook und eine minimale Auswahl an Anwendungen - oder ...desktop
- :-1:  plasma-desktopthemes-artwork  -- Desktop Themes für KDE Plasma Workspaces 
- :-1:  plasma-widget-networkmanagement  -- Transitional package for plasma-nm
 
- :-1:  skanlite  --	Auf dem KSane-Backend basierendes Scanprogramm für KDE 4 
- :-1:  kontact  --	    Integrierte Anwendung für die Verwaltung persönlicher Informationen
- :-1:  konsolekalendar  -- Persönlicher Organizer für die Konsole
- :x:  konsole  -- KDE Terminal


- ###  kde-l10n  -- virtuelles Paket 

- :-1:  kde-l10n-de  --	Deutsche (de) Lokalisierung für KDE

- ### :-1:  task-mate-desktop  -- [Mate Desktop Umgebung] (task-mate-desktop.md)
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption (kvm -m 1024) benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption (kvm -m 256), für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )

- ### :o:  task-gnome-desktop  -- 

- ### :o:  task-xfce-desktop  --

- ### :o:  task-cinnamon-desktop  --

##  Desktop office  -- Büroprogramme - Textverarbeitung - Tabellenkalkulation etc.

- :-1:  vim-gtk  --	verbessserter vi-Editor - mit GTK2-Oberfläche
- :+1:  pdftk  --	Werkzeug für die Manipulation von PDF-Dokumenten - benötigt Java runtime
- :-1:  xournal  --	GTK+-Anwendung für Notizen -- auch in *.pdf
- :-1:  scribus  --	DTP-Programm
- :-1:  scribus-template  -- Vorlagen

- ###  libreoffice

- :-1:  libreoffice-base  --	Datenbank
- :-1:  libreoffice-calc  --	Tabellenkalkulation
- :-1:  libreoffice-dmaths  --	Verbesserungen für den LibreOffice-Formeleditor
- :-1:  libreoffice-draw  --	Zeichenprogramm
- :-1:  libreoffice-help-de  --	Deutsche Hilfe
- :-1:  libreoffice-l10n-de  --	Deutsches Sprachpaket 

- ###  kommunikation

- :x:  firefox-esr  --	Mozilla Firefox web browser
- :-1:  firefox-esr-l10n-de  -- Deutsches Sprachpaket

- :-1:  evolution  --	 Groupware-Suite mit E-Mail-Client und Organizer
- :-1:  icedove  --	E-Mail- und News-Client mit RSS-Unterstützung und integriertem Spam-Filter 
[//]: # (Carsten: Wie viel Aufwand macht es das Programm als Thunderbird mit "Original-Logo" zu installieren? Sollte doch Lizenzrechtlich möglich sein. Bei Ubuntu geht es ja auch. Hintergrund: Möglichst wenig Verwirrung stiften. Außerdem läuft Icedove 45.2.0 aus debian stable bei mir nicht besonders stabil.)
[//]: # (Gerd: icedove entspricht Thunderbird Version 45.2.0 -- muss jemand testen - kann sein das enigmail unkompatible mit dem PGP-Agent ist ? )
- :-1:  icedove-l10n-de
- :-1:  enigmail   --	GPG-Unterstützung für Thunderbird und Debian Icedove

- :-1:  pidgin  --	Grafischer Instant-Messaging-Client
- :-1:  pidgin-encryption  -- Pidgin-Erweiterung, die transparente Verschlüsselung bietet
- :-1:  pidgin-otr  --	Pidgin-Erweiterung für Off-the-Record Messaging 

##  Desktop Video - Audio - Bilder

- :-1:  vlc  --		Multimedia-Player und Streamer
- :-1:  audacity  --	Schneller, plattformunabhängiger Audio-Editor 
- :+1:  geeqie  --	Bildbetrachtung - Bildvorschau - Diashow -- verwendet GTK+
- :-1:  inkscape  --	Vektorbasiertes Zeichenprogramm
- :-1:  gimp  --		Das GNU-Bildbearbeitungsprogramm
- :+1:  gimp-data-extras  -- Ein extra Satz Pinsel, Paletten, Gradienten für GIMP
- :-1:  gimp-dcraw  --	GIMP-Erweiterung zum Laden von RAW-Digitalfotos		-- kollidiert mit gimp-ufraw
- :+1:  gimp-ufraw  --	Gimp Importierprogramm für Kamerabilder im raw-Format
- :o:  gimp-help-de  --	Dokumentation für GIMP (Deutsch) - in stretch (testing)
- :-1:  darktable  --	Virtueller Leuchttisch und virtuelle Dunkelkammer für Fotografen 
- :-1:  rawtherapee  --	Umwandler für RAW-Bilder und Bearbeitungssoftware für Digitalfotos

## Desktop Grafik

- :+1:  blender  --	Sehr schnelle und vielseitige Suite für 3D-Modellierung/-Rendering
- :+1:  makehuman  --	Modelling of 3-Dimensional humanoid characters - ab stretch
- :+1:  sweethome3d  --	Interior 2D design application with 3D preview (java)
- :+1:  sweethome3d-furniture-editor  -- Sweet Home 3D Furniture Library Editor
- :+1:  sweethome3d-textures-editor  --  Sweet Home 3D Textures Library Editor

##  Education - Science  --  Bildung und Wissenschaft

- ###  mathematics

- :-1:  octave  --	GNU Octave - Sprache für numerische Berechnungen
- :-1:  octave-control
- :-1:  geogebra  --	Dynamische Mathematiksoftware für die Lehre
- :o:  geogebra-gnome  -- GNOME-Integrationsebene für GeoGebra 
- :-1:  geogebra-kde  -- KDE integration layer for GeoGebra 
- :-1:  gnuplot  --	Kommandozeilengesteuertes, interaktives Plot-Programm 

- :+1:  kmplot  --	Mathematischer Funktionsplotter für KDE

- ###  scientific python (inkl. Abhängigkeiten)
- :x:  build-essential  -- Kompiler und diverse Bibliotheken (wichtig)
- :x:  python3-dev  -- Header (zum kompilieren von Python-Paketen, wird vom Hook gebraucht)

- :x:  python-pip  -- Pythons eigener Paketmanager
- :x:  python3-pip  -- Pythons eigener Paketmanager

- :-1:  ipython3  --	Erweiterte interaktive Python-3-Shell -- Die Version aus den Debian Paketquellen ist zu alt. IPython wird stattdessen separat über einen Hook installiert
[//]: # (Carsten: Mir ist es wichtig, dass der ganze Python-Kram aktuell ist, weil da in den letzten Jahren viel pasiert ist. Aktuell ist IPython5. Das würde ich zusammen mit anderen Abhängigkeiten separat (aus den passenden Quellen installieren. Ich kümmere mich im September drum, könnte aber ggf. Hilfe gebrauchen.))
- :x:  python-numpy
- :x:  python3-numpy
- :x:  python-scipy
- :x:  python3-scipy
- :x:  python-matplotlib
- :x:  python3-matplotlib

- ###  chemistry

- :-1:  kalzium  --	Periodensystem und Chemiewerkzeuge
- :-1:  kalzium-data 

- ###  languages

- :-1:  kwordquiz  --	Lernkarten-Lernprogramm für KDE -- TODO: benötigt noch gut Vokabellisten für Latein, Englisch, Spanisch, Italienisch

- ###  electronics

- :+1:  qucs  --	Schaltungssimulation -- 
  - TODO: nicht in den offiziellen stable Quellen, gibt es aber hier: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb 
    - Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl
    - Recommends: freehdl, verilog, octave 
    - Außerdem brauchen wir noch Beispiele


##  TexLive  -- LaTex Toolbox - Dokumenten Satzprogramm 

- :-1:  texlive
- :-1:  texlive-base
- :-1:  texlive-bibtex-extra	
- :-1:  texlive-binaries	
- :-1:  texlive-doc-de
- :-1:  texlive-extra-utils  --		für pdfjam (pdf90)
- :-1:  texlive-font-utils	
- :-1:  texlive-fonts-extra	
- :-1:  texlive-fonts-extra-doc	
- :-1:  texlive-fonts-recommended	
- :-1:  texlive-fonts-recommended-doc	
- :-1:  texlive-formats-extra
- :-1:  texlive-generic-recommended	
- :-1:  texlive-lang-german
- :-1:  texlive-latex-base
- :-1:  texlive-latex-base-doc
- :-1:  texlive-latex-extra  --		gut für Beamer-presentation
- :-1:  texlive-latex-extra-doc
- :-1:  texlive-latex-recommended	
- :-1:  texlive-latex-recommended-doc	
- :-1:  texlive-luatex
- :-1:  texlive-math-extra
- :-1:  texlive-pictures	
- :-1:  texlive-pictures-doc
- :-1:  texlive-plain-extra	
- :-1:  texlive-pstricks	
- :-1:  texlive-pstricks-doc
- :-1:  texlive-publishers	
- :-1:  texlive-publishers-doc
- :-1:  texlive-xetex
- :-1:  texstudio  --			LaTeX-Editor - GUI
- :-1:  texstudio-doc
- :-1:  texstudio-l10n


##  Programmierung Softwareentwicklung

- :-1:  git  --		Schnelles, skalierbares, verteiltes Revisions-Kontroll-System
- :-1:  git-gui  --	Schnelles, skalierbares, verteiltes Versionskontrollsystem (grafische Oberfläche) 
- :-1:  gitk  --	Schnelles, skalierbares, verteiltes Revisions-Kontrollsystem (Visualisierungsprogramm) 


##  Terminal Tools

- :-1:  mc  --		Midnight Commander - ein guter Dateimanager
- :-1:  vim  --		verbesserter vi-Editor
- :-1:  vimhelp-de  --	Dokumentationsdateien (deutsche Übersetzung)
- :+1:  vim-scripts  --	Erweiterungen für vim
- :-1:  screen  --	Terminalmultiplexer mit VT100/ANSI-Terminalemulation
- :-1:  silversearcher-ag  -- sehr schnell grep-ähnliches Programm

- ###  grafik

- :-1:  dvipng  --	Konvertiert DVI-Dateien in PNG-Grafiken
- :-1:  imagemagick  --	Bildbearbeitungsprogramme - gut in Skripten zu verwenden z.B.: ganze Bilderordner konvertieren

- ###  utils

- :-1:  pciutils  --	PCI-Hilfsprogramme
- :-1:  lshw  --		Informationen über die Hardwarekonfiguration
- :-1:  lsdvd  --	liest die Inhaltsinformation einer DVD
- :-1:  udisks  --	zum ein/aushängen von Speichermedien 
- :-1:  sshfs  --	Dateisystemclient, der auf dem SSH-Dateiübertragungsprotokoll basiert

- ###  text 

- :-1:  most  --		Pager-Programm - alternativ zu more / less

- ###  admin

- :-1:  dselect  --	Oberfläche für die Debian-Paketverwaltung 
- :-1:  fbset  --	Framebuffer-Geräte einstellen
- :-1:  localepurge  --	Freigeben von Festplattenplatz durch Entfernen nicht benötigter Lokalisierungen 
- :-1:  cryptsetup  --	Unterstützung für Festplattenverschlüsselung - Startskripte

- ###  kernel

- :-1:  squashfs-tools  -- Werkzeug zum Erzeugen und Hinzufügen von squashfs-Dateisystemen

##  German User  -- System Tools - Deutsche Sprachpakete

- ###  task-german

- :-1:  manpages-de
- :-1:  wngerman
- :-1:  ingerman
- :-1:  aspell-de
- :-1:  aspell-de-alt

- :-1:  util-linux-locales


##  wlan  -- System Tools - Hardware

- :-1:  wireless-tools  --	zum Bearbeiten von WLAN Einstellungen 
- :-1:  firmware-b43-installer  -- installiert die Broadcom 43xx WLAN Karten Firmware
[//]: # (Carsten: Ist das nur der Installer, oder der komplette Treiber?)
[//]: # (Gerd: installiert den Firmwareteil der Treiber)

- [ ]  firmware-b43-installer

##  live  -- System Pakete werden fürs Live-System benöttigt

- :x:  live-boot 
- :x:  live-config
- :x:  live-config-systemd


