[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)


# Paketliste für FSFW UNI Stick (USB-Live-Stick) 

>  zum automatisierten erstellen der Paketlisten aus dieser Doku Paketliste
>  $ auto/paketliste   --  im live-build-Verzeichnis ausführen
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

- :x:  akregator  --	RSS/Atom-Feed-Aggregator 
- :x:  ark  --		Archiv-Werkzeug 
- :x:  dragonplayer  --	Einfacher Videoabspieler 
- :x:  gwenview  --	Bildbetrachter 
- :x:  juk  --		Jukebox und Musikabspieler 
- :x:  kaddressbook  --	Adressbuch- und Kontaktdatenverwaltung 
- :x:  kate  --		Leistungsstarker Texteditor 
- :x:  kcalc  --	Einfacher wissenschaftlicher Taschenrechner 
- :x:  khelpcenter4  --	Hilfezentrum 
- :x:  kmail  --	Vollständiger grafischer E-Mail-Client 
[//]: # (Carsten: bei kmail wäre zu überlegen, ob man es nicht weglässt. icedove (bzw. vorzugsweise thunderbird) ist ohnehin gesetzt. Alles weitere verwirrt nur.
- :x:  kmix  --		Lautstärkeregler und Mischer 
- :x:  knotes  --	Programm für Haftnotizen (sticky notes) 
- :x:  kopete  --	Instant-Messaging- und Chat-Anwendung 
- :x:  korganizer  --	Kalender und persönliche Terminverwaltung 
- :x:  kscreensaver  --	Zusätzliche Bildschirmschoner für KScreenSaver 
- :x:  ksnapshot  --	Werkzeug für die Erstellung von Bildschirmfotos 
- :x:  kwalletmanager  -- Sichere Passwortverwaltung 
- :x:  okular  --	Universal-Dokumentenbetrachter 
- :x:  polkit-kde-1  --	KDE-Dialoge für PolicyKit 
- :x:  sweeper  --	Löschen von Verlauf und temporären Dateien 
- :x:  freespacenotifier  -- KDE-Modul zur Benachrichtigung bei Platzmangel 
- :x:  konq-plugins  --	Erweiterungen für Konqueror, den KDE-Datei-/Web-/Dokumenten-Browser 
- :x:  kdeplasma-addons  -- Plasma-Erweiterungen 
- :x:  kde-plasma-desktop  -- KDE Plasma Desktop und eine minimale Auswahl an Anwendungen - oder ...netbook
- :x:  kde-plasma-netbook  -- KDE Plasma Netbook und eine minimale Auswahl an Anwendungen - oder ...desktop
- :x:  plasma-desktopthemes-artwork  -- Desktop Themes für KDE Plasma Workspaces 
- :x:  plasma-widget-networkmanagement  -- Transitional package for plasma-nm
 
- :x:  skanlite  --	Auf dem KSane-Backend basierendes Scanprogramm für KDE 4 

- ###  kde-l10n  -- virtuelles Paket 

- :x:  kde-l10n-de  --	Deutsche (de) Lokalisierung für KDE

- ###  task-mate-desktop  -- Mate Desktop Umgebung

- :o:  lightdm  --		Einfaches grafisches Login-Programm
- :o:  mate-desktop-environment-core
- :o:  atril  --		MATE-Dokumentenbetrachter
- :o:  engrampa  --		MATE-Archivmanager 
- :o:  eom  --			Bildbetrachter Eye of MATE 
- :o:  ffmpegthumbnailer  --	Schnelles und leichtgewichtiges Programm für Video-Miniaturansichten 
- :o:  galculator  --		Wissenschaftlicher Taschenrechner 
- :o:  mate-applets  --		Diverse Applets für das MATE-Panel 
- :o:  mate-icon-theme-faenza  -- MATE Faenza Desktop icon theme 
- :o:  mate-notification-daemon  -- daemon for displaying passive pop-up notifications 
- :o:  mate-power-manager  --	Werkzeug zur Energieverwaltung für die Arbeitsumgebung MATE 
- :o:  mate-screensaver  --	MATE-Bildschirmschoner und -sperrer 
- :o:  mate-system-monitor  --	Prozessanzeige und Ressourcenmonitor für MATE 
- :o:  mate-themes  --		Official themes for the MATE desktop 
- :o:  mate-utils  --		Hilfsprogramme für den MATE-Desktop 
- :o:  pluma  --		Offizieller Texteditor der Arbeitsumgebung MATE 

- ###  mate-media  --		MATE media utilities - PulseAudio oder GStreamer

- :o:  mate-media-pulse  --	MATE media utilities (PulseAudio Backend)
- :o:  mate-media-gstreamer  --	MATE-Medienwerkzeuge (GStreamer Backend) 

- ###  task-gnome-desktop -- 

- ###  task-xfce-desktop  --

- ###  task-cinnamon-desktop  --

##  Desktop office  -- Büroprogramme - Textverarbeitung - Tabellenkalkulation etc.

- :x:  vim-gtk  --	verbessserter vi-Editor - mit GTK2-Oberfläche
- :+1:  pdftk  --	Werkzeug für die Manipulation von PDF-Dokumenten - benötigt Java runtime
- :x:  xournal  --	GTK+-Anwendung für Notizen -- auch in *.pdf
- :x:  scribus  --	DTP-Programm
- :x:  scribus-template  -- Vorlagen

- ###  libreoffice

- :x:  libreoffice-base  --	Datenbank
- :x:  libreoffice-calc  --	Tabellenkalkulation
- :x:  libreoffice-dmaths  --	Verbesserungen für den LibreOffice-Formeleditor
- :x:  libreoffice-draw  --	Zeichenprogramm
- :x:  libreoffice-help-de  --	Deutsche Hilfe
- :x:  libreoffice-l10n-de  --	Deutsches Sprachpaket 

- ###  kommunikation

- :x:  firefox-esr  --	Mozilla Firefox web browser
- :x:  firefox-esr-l10n-de  -- Deutsches Sprachpaket

- :x:  evolution  --	 Groupware-Suite mit E-Mail-Client und Organizer
- :x:  icedove  --	E-Mail- und News-Client mit RSS-Unterstützung und integriertem Spam-Filter 
[//]: # (Carsten: Wie viel Aufwand macht es das Programm als Thunderbird mit "Original-Logo" zu installieren? Sollte doch Lizenzrechtlich möglich sein. Bei Ubuntu geht es ja auch. Hintergrund: Möglichst wenig Verwirrung stiften. Außerdem läuft Icedove 45.2.0 aus debian stable bei mir nicht besonders stabil.)
[//]: # (Gerd: icedove entspricht Thunderbird Version 45.2.0 -- muss jemand testen - kann sein das enigmail unkompatible mit dem PGP-Agent ist ? )
- :x:  icedove-l10n-de
- :x:  enigmail   --	GPG-Unterstützung für Thunderbird und Debian Icedove

- :x:  pidgin  --	Grafischer Instant-Messaging-Client
- :x:  pidgin-encryption  -- Pidgin-Erweiterung, die transparente Verschlüsselung bietet


##  Desktop Video - Audio - Bilder

- :x:  vlc  --		Multimedia-Player und Streamer
- :x:  audacity  --	Schneller, plattformunabhängiger Audio-Editor 
- :+1:  geeqie  --	Bildbetrachtung - Bildvorschau - Diashow -- verwendet GTK+
- :x:  inkscape  --	Vektorbasiertes Zeichenprogramm
- :x:  gimp  --		Das GNU-Bildbearbeitungsprogramm
- :+1:  gimp-data-extras  -- Ein extra Satz Pinsel, Paletten, Gradienten für GIMP
- :-1:  gimp-dcraw  --	GIMP-Erweiterung zum Laden von RAW-Digitalfotos		-- kollidiert mit gimp-ufraw
- :+1:  gimp-ufraw  --	Gimp Importierprogramm für Kamerabilder im raw-Format
- :o:  gimp-help-de  --	Dokumentation für GIMP (Deutsch) - in stretch (testing)

##  Education - Science  --  Bildung und Wissenschaft

- ###  mathematics

- :x:  octave  --	GNU Octave - Sprache für numerische Berechnungen
- :x:  octave-control

- :+1:  kmplot  --	Mathematischer Funktionsplotter für KDE

- ###  scientific python

- :x:  ipython3  --	Erweiterte interaktive Python-3-Shell
[//]: # (Carsten: Mir ist es wichtig, dass der ganze Python-Kram aktuell ist, weil da in den letzten Jahren viel pasiert ist. Aktuell ist IPython5. Das würde ich zusammen mit anderen Abhängigkeiten separat (aus den passenden Quellen installieren. Ich kümmere mich im September drum, könnte aber ggf. Hilfe gebrauchen.))

- ###  chemistry

- :x:  kalzium  --	Periodensystem und Chemiewerkzeuge
- :x:  kalzium-data 

- ###  languages

- :x:  kwordquiz  --	Lernkarten-Lernprogramm für KDE -- TODO: benötigt noch gut Vokabellisten für Latein, Englisch, Spanisch, Italienisch

- ###  electronics

- :+1:  qucs  --	Schaltungssimulation -- TODO: nicht in den offiziellen stable Quellen, gibt es aber hier: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb # Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl # Recommends: freehdl, verilog, octave # Außerdem brauchen wir noch Beispiele


##  TexLive  -- LaTex Toolbox - Dokumenten Satzprogramm 

- :x:  texlive
- :x:  texlive-base
- :x:  texlive-bibtex-extra	
- :x:  texlive-binaries	
- :x:  texlive-doc-de
- :x:  texlive-extra-utils  --		für pdfjam (pdf90)
- :x:  texlive-font-utils	
- :x:  texlive-fonts-extra	
- :x:  texlive-fonts-extra-doc	
- :x:  texlive-fonts-recommended	
- :x:  texlive-fonts-recommended-doc	
- :x:  texlive-formats-extra
- :x:  texlive-generic-recommended	
- :x:  texlive-lang-german
- :x:  texlive-latex-base
- :x:  texlive-latex-base-doc
- :x:  texlive-latex-extra  --		gut für Beamer-presentation
- :x:  texlive-latex-extra-doc
- :x:  texlive-latex-recommended	
- :x:  texlive-latex-recommended-doc	
- :x:  texlive-luatex
- :x:  texlive-math-extra
- :x:  texlive-pictures	
- :x:  texlive-pictures-doc
- :x:  texlive-plain-extra	
- :x:  texlive-pstricks	
- :x:  texlive-pstricks-doc
- :x:  texlive-publishers	
- :x:  texlive-publishers-doc
- :x:  texlive-xetex
- :x:  texstudio  --			LaTeX-Editor - GUI
- :x:  texstudio-doc
- :x:  texstudio-l10n


##  Terminal Tools

- :x:  mc  --		Midnight Commander - ein guter Dateimanager
- :x:  vim  --		verbesserter vi-Editor
- :x:  vimhelp-de  --	Dokumentationsdateien (deutsche Übersetzung)
- :+1:  vim-scripts  --	Erweiterungen für vim
- :x:  screen  --	Terminalmultiplexer mit VT100/ANSI-Terminalemulation
- :x:  silversearcher-ag  -- sehr schnell grep-ähnliches Programm

- ###  grafik

- :x:  dvipng  --	Konvertiert DVI-Dateien in PNG-Grafiken
- :x:  imagemagick  --	Bildbearbeitungsprogramme - gut in Skripten zu verwenden z.B.: ganze Bilderordner konvertieren

- ###  utils

- :x:  pciutils  --	PCI-Hilfsprogramme
- :x:  lshw  --		Informationen über die Hardwarekonfiguration
- :x:  lsdvd  --	liest die Inhaltsinformation einer DVD
- :x:  udisks  --	zum ein/aushängen von Speichermedien 

- ###  text 

- :x:  most  --		Pager-Programm - alternativ zu more / less

- ###  admin

- :x:  dselect  --	Debian Package Verwaltung
- :x:  fbset  --	Framebuffer-Geräte einstellen
- :x:  localepurge  --	Freigeben von Festplattenplatz durch Entfernen nicht benötigter Lokalisierungen 
- :x:  cryptsetup  --	Festplattenverschlüsselung

- ###  kernel

- :x:  squashfs-tools  -- Werkzeug zum Erzeugen und Hinzufügen von squashfs-Dateisystemen

##  German User  -- System Tools - Deutsche Sprachpakete

- ###  task-german

- :x:  manpages-de
- :x:  wngerman
- :x:  ingerman
- :x:  aspell-de
- :x:  aspell-de-alt

- :x:  util-linux-locales


##  wlan  -- System Tools - Hardware

- :x:  wireless-tools  --	zum Bearbeiten von WLAN Einstellungen 
- :x:  firmware-b43-installer  -- installiert die Broadcom 43xx WLAN Karten Firmware
[//]: # (Carsten: Ist das nur der Installer, oder der komplette Treiber?)
[//]: # (Gerd: installiert den Firmwareteil der Treiber)

- [ ]  firmware-b43-installer

##  live  -- System Pakete werden fürs Live-System benöttigt

- :x:  live-boot 
- :x:  live-config
- :x:  live-config-systemd


