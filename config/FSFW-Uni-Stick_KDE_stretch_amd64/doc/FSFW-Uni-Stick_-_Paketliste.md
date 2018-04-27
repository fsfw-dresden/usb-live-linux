[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)


# Paketliste für FSFW UNI Stick (USB-Live-Stick)

>  zum automatisierten erstellen der Paketlisten aus dieser Doku Paketliste
>  ` $ sudo ./auto/paketliste `   --  im live-build-Verzeichnis ausführen
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
> - :+1:  Paket vorschlag  -- Abstimmung im Plenum (reguläre Treffen) folgt 	-- Beschreibung
>	- Paket kann im Live-System auch nachträglich installiert werden
>	- Wird der Persistence-Mode benutzt bleibt es auch erhalten.
>
>		Alt+F2	--> konsole
>
>		`$ sudo apt-get install Paketname `
>
> - :+1: :x:  [Paket vorschlag](http://download-path-paket.deb)  -- ist leider nicht in den Repos verfügbar, wird aber alternativ installiert
>		- Beschreibung / Erklärungen
>		- Extra Installation da nicht im Repo verfügbar
>		- Quelle:
>		- Abhängigkeiten / Besonderheiten
>
> - :o: :-1:  Paket derzeit nicht benutzt weil -- (Pakete die bei der Installation Probleme/Kollisionen mit anderen Programmen verursachen )
>		- Beschreibung / Erklärungen - fals möglich Lösungsvorschläge
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

##  Desktop

- :o:  task-desktop  -- Grafische Desktop Umgebung - Progamm Sammlung
 - :x:  desktop-base  -- Allgemeine Dateien für den Debian-Desktop

[//]: # ( gerd: schlägt bevorzugt >> recommends true << gnome als Desktop vor - alternativ kde-standard,xfce4,wmaker )
- :x:  xorg  --
  - :x:  xserver-xorg  --
   - :x:  x11-utils  -- Hilfsprogramme für X11
   - :x:  mesa-utils  -- Mesa-GL-Hilfsprogramme
  - :x:  libgl1-mesa-dri  -- 	Freie Implementierung der OpenGL-Schnittstelle
[//]: # ( ohne mesa kein blender )
  - :x:  libegl1-mesa-drivers  -- free implementation of the EGL API -- hardware drivers

 - :x:  xserver-xorg-input-all  -- X.org-X-Server -- Metapaket für Eingabegeräte-Treiber 
 - :x:  xserver-xorg-video-all  -- alle Grafik-Treiber (10 MB)

 - :o:  xfonts-utils  --
  - :x:  gsfonts-x11  --
 - :x:  xdg-user-dirs  --	Werkzeug zur Verwaltung von Benutzerordnern

- ###  task-kde-desktop  -- KDE Desktop Umgebung

- :o:  kde-full  --  Vollständige KDE (5:92) Software Compilation für Anwender
- :o:  task-kde-desktop  --
- :x:  sddm  --		Moderner Displaymanager für X11

- :x:  kde-style-oxygen-qt5  -- Oxygen desktop theme is used by Plasma and other KDE Software
- :x:  kwin-x11  -- KDE-Fenstermanager - X11-Version

- ###  kde-standard

- :x:  akregator  --	RSS/Atom-Feed-Aggregator
- :x:  ark  --		Archiv-Werkzeug
- :x:  dragonplayer  --	Einfacher Videoabspieler
- :x:  gwenview  --	Bildbetrachter
- :x:  juk  --		Jukebox und Musikabspieler
- :x:  kaddressbook  --	Adressbuch- und Kontaktdatenverwaltung
- :x:  kate  --		Leistungsstarker Texteditor
- :x:  kcalc  --	Einfacher wissenschaftlicher Taschenrechner
- :x:  kde-plasma-desktop  -- KDE Plasma Desktop und eine minimale Auswahl an Anwendungen - oder ...netbook
 - :x:  user-manager  -- user management tool for the Plasma workspace
- :x:  kde-spectacle  -- Werkzeug für die Erstellung von Bildschirmfotos (ersetzt KSnapshot)
- :x:  khelpcenter  --	Hilfezentrum
- :x:  kmail  --	Vollständiger grafischer E-Mail-Client

[//]: # (Carsten: bei kmail wäre zu überlegen, ob man es nicht weglässt. icedove >> bzw. vorzugsweise thunderbird << ist ohnehin gesetzt. Alles weitere verwirrt nur.)
- :x:  knotes  --	Programm für Haftnotizen (sticky notes)
- :x:  kopete  --	Instant-Messaging- und Chat-Anwendung
- :x:  korganizer  --	Kalender und persönliche Terminverwaltung
- :x:  kwalletmanager  -- Sichere Passwortverwaltung
- :x:  okular  --	Universal-Dokumentenbetrachter
- :x:  plasma-dataengines-addons  --  additional data engines for Plasma
- :x:  plasma-pa  --    Plasma 5 Volume controller
- :x:  kmix  --		Lautstärkeregler und Mischer
- :x:  plasma-runners-addons  -- additional runners for Plasma 5 and Krunner
- :x:  plasma-wallpapers-addons  -- additional wallpaper plugins for Plasma 5
- :x:  plasma-widgets-addons  --    additional widgets for Plasma 5
- :x:  polkit-kde-agent-1  --	KDE-Dialoge für PolicyKit
- :x:  sweeper  --	Löschen von Verlauf und temporären Dateien
- :x:  konq-plugins  --	Erweiterungen für Konqueror, den KDE-Datei-/Web-/Dokumenten-Browser
- :x:  plasma-nm  --    Plasma5-Bibliothek zur Netzwerkverwaltung
- :x:  skanlite  --	Auf dem KSane-Backend basierendes Scanprogramm für KDE 4

- ###  kde-l10n  -- virtuelles Paket zur Sprachenunterstützung

- :x:  kde-l10n-de  --	Deutsche (de) Lokalisierung für KDE
- :x:  systemsettings  -- Anwendung zur Konfiguration der Arbeitsfläche

##  KDE Programme

- :o:  ksnapshot  --	Werkzeug für die Erstellung von Bildschirmfotos
- :x:  okular-extra-backends  --  Unterstützung von zusätzlichen Dokumentformaten für Okular
- :x:  kontact  --	    Integrierte Anwendung für die Verwaltung persönlicher Informationen
- :x:  konsolekalendar  -- Persönlicher Organizer für die Konsole
- :+1:  kteatime  -- Kurzzeitwecker, damit der Tee weder zu kurz och zu lange zieht
- :+1:  ktimetracker  -- Zeiterfassungstool zur Unterstützung bei der Zeiteinteilung

- :x:  kdiff3  -- Vergleicht und führt zwei oder drei Dateien oder Verzeichnisse zusammen
- :x:  kdesudo  -- sudo-Oberfläche für KDE
- :x:  partitionmanager  -- 	KDE-Programm zur Verwaltung von Dateien, Platten und Partitionen
- :x:  filelight  -- Speicherbelegungsvisualisierung
- :o:  kde-wallpapers  -- Hintergrundbilder für den KDE-Desktop (Größe 90 MB)

[//]: # (Dieses Paket scheint eine Abhängigkeit zu sein, das automatisch mit installiert wird, auch wenn es hier garnicht zum Installieren ausgewählt wurde.)

- :x:  kdeartwork-wallpapers  --
- :x:  plasma-workspace-wallpapers  --
- :x:  fonts-oxygen  --
- :x:  kde-style-oxygen-qt4  --
- :x:  kwin-decoration-oxygen  --
- :x:  gnome-keyring  --

- ### :o:  task-mate-desktop  -- [Mate Desktop Umgebung](task-mate-desktop.md)

[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption >> kvm -m 1024 << benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption >> kvm -m 256 <<, für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )

- ### :o:  task-gnome-desktop  --

- ### :o:  task-xfce-desktop  --

- ### :o:  task-cinnamon-desktop  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :o:  Accessibility-Paketliste  -- [Software zur Barrierereduzierung](Accessibility-Paketliste.md)

- ###

##  Desktop office  -- Büroprogramme - Textverarbeitung - Tabellenkalkulation etc.

- ###  Textverarbeitung

- :o:  vim-gtk  --	verbessserter vi-Editor - mit GTK2-Oberfläche
- :x:  zim  -- Desktopwiki, welches durch Plugins erweitert werden kann

- ###  libreoffice

- :x:  libreoffice-base  --	Datenbank
- :x:  libreoffice-calc  --	Tabellenkalkulation
- :x:  libreoffice-writer  --	Text-Verarbeitung
- :x:  libreoffice-math  --	Formel-Editor
- :o: :-1:  libreoffice-dmaths  --	Verbesserungen für den LibreOffice-Formeleditor
- :x:  libreoffice-draw  --	Zeichenprogramm
- :+1:  libreoffice-help-de  --	Deutsche Hilfe
- :x:  libreoffice-l10n-de  --	Deutsches Sprachpaket
- :x:  libreoffice-java-common  -- architekturunabhängige Dateien der Java-Unterstützung

- ###  PDF-Tools

- :x:  pdftk  --	Werkzeug für die Manipulation von PDF-Dokumenten - benötigt Java runtime
- :x:  diffpdf  --	grafischer PDF-Vergleicher
- :x:  xournal  --	GTK+-Anwendung für Notizen -- auch in *.pdf
- :x:  pdfgrep  --	grep-artiges Suchprogramm für PDF-Dateien für die Konsole
- :x:  pdfmod  --	PDF-Bearbeitungsfrontend
- :x:  pdfresurrect  -- zeigt Überarbeitungen in PDF-Dateien, falls vorhanden
- :x:  pdfchain  --	Grafische Benutzeroberfläche für das PDF Tool Kit

- ###  Literaturverwaltung

- :x:  jabref  -- umfangreiche Literatur- und Quellenverwaltung (javabasiert)
- :o: :-1:  jabref-plugin-oo  -- Jabref-Plugin für LibreOffice
- :+1:  docear  -- Literaturverw. per Mindmap (leider nicht in den Repos sondern nur auf <www.docear.org>)
- :+1:  kbibtex  -- Kde basierte Literaturverwaltung
- :+1:  utopia-documents  -- PDF-Viewer mit der Möglichkeit seine Annotationen Online zu teilen
- :+1:  referencer  -- einfache Literaturverwaltung für den Gnomedesktop

- ###  kommunikation

- :x:  firefox-esr  --	Mozilla Firefox Webbrowser               (Größe 100 MB)
- :x:  firefox-esr-l10n-de  -- Deutsches Sprachpaket für den Firefox

- :+1:  evolution  --	 Groupware-Suite mit E-Mail-Client und Organizer
- :x:  icedove  --	E-Mail- und News-Client mit RSS-Unterstützung, Kalender, Adressbuch und integriertem Spam-Filter         (Größe 102 MB)

[//]: # (Carsten: Wie viel Aufwand macht es das Programm als Thunderbird mit "Original-Logo" zu installieren? Sollte doch Lizenzrechtlich möglich sein. Bei Ubuntu geht es ja auch. Hintergrund: Möglichst wenig Verwirrung stiften. Außerdem läuft Icedove 45.2.0 aus debian stable bei mir nicht besonders stabil.)
[//]: # (Gerd: icedove entspricht Thunderbird Version 45.2.0 -- muss jemand testen - kann sein das enigmail unkompatible mit dem PGP-Agent ist ? )
- :x:  icedove-l10n-de
- :x:  enigmail   --	GPG-Unterstützung für Thunderbird und Debian Icedove

- :x:  pidgin  --	Grafischer Instant-Messaging-Client
- :x:  pidgin-encryption  -- Pidgin-Erweiterung, die transparente Verschlüsselung bietet
- :x:  pidgin-otr  --	Pidgin-Erweiterung für Off-the-Record Messaging

##  Desktop Video - Audio - Bilder - 3D

- ###  Audio

- :x:  audacity  --	Schneller, plattformunabhängiger Audio-Editor
- :o:  ardour3  -- Audioeditor/ DAW für den Gnoem-Desktop

[//]: # (Aktuell nicht installiert, da bereits audacity installiert wird)

- :+1:  csound  -- Soundsynthese und Multieffekt-Prozessor

[//]: # (Erwähnt von Hochschule für Musik Dresden)

- :+1:  supercollider  -- algorithmische Soundsynthese

[//]: # (Erwähnt von Hochschule für Musik Dresden)

- :+1:  puredata  -- Echtzeit-Musik- & Grafiksystem

[//]: # (Erwähnt von Hochschule für Musik Dresden)

- :x:  transcriber  -- Programm zum Transkripieren (z.B. von Interviews)

- ###  Video

- :x:  vlc  --		Multimedia-Player und Streamer
- :o:  pitivi  -- Videoschnitt (entweder Pitivi oder Kdenlive)
- :o:  kdenlive  -- Videoschnitt
- :+1:  mkvtoolnix  -- Toolsammlung fürs Matroska-Containerformat für Mediendateien (Audio+Video, incl. Metadaten)
- :+1:  mkvtoolnix-gui  -- GUI für mkvtoolnix
- :+1:  oggvideotools  -- Tools fürs Ogg-Mediencontainerformat
- :o:  subtitlecomposer  -- Untertiteleditor
- :+1:  winff-qt  -- Videoformatkonverter


- ### Konverter und sonstiges

- :+1:  ogmtools  -- Dient der Bearbeitung von OGG-Streams
- :+1:  oggconvert  -- Dienst der Konvertierung verschiedener Medienformate in freie Formate


##  Desktop Grafik

- :x:  dia  -- umfangreiches Diagrammerstellungsprogramm
- :+1:  geeqie  --	Bildbetrachtung - Bildvorschau - Diashow -- verwendet GTK+
- :x:  inkscape  --	Vektorbasiertes Zeichenprogramm
- :x:  sozi  -- Inkscape-Plugin für kreative Präsentationen
- :x:  gimp  --		Das GNU-Bildbearbeitungsprogramm
- :+1:  gimp-data-extras  -- Ein extra Satz Pinsel, Paletten, Gradienten für GIMP
- :x:  gimp-dcraw  --	GIMP-Erweiterung zum Laden von RAW-Digitalfotos		-- kollidiert mit gimp-ufraw
- :o:  gimp-ufraw  --	Gimp Importierprogramm für Kamerabilder im raw-Format
- :o:  gimp-help-de  --	Dokumentation für GIMP (Deutsch) - in stretch (testing)
- :o:  darktable  --	Virtueller Leuchttisch und virtuelle Dunkelkammer für Fotografen
- :x:  rawtherapee  --	Umwandler für RAW-Bilder und Bearbeitungssoftware für Digitalfotos
- :x:  icc-profiles-free  -- Freie Farbprofile für die Kompatibilität mit den Farbverwaltungen anderer Grafikprogramme
- :x:  scribus  --	DTP-Programm
- :+1:  scribus-template  -- Vorlagen
- :x:  xsane  --	Grafische Oberfläche für SANE (Scanner Access Now Easy) mit vielen Fähigkeiten

- ###  Fotoverwaltung

- :x:  digikam  -- Full-Featured Fotoverwaltung für KDE
- :+1:  digikam-doc  --
- :+1:  kipi-plugins  -- Grafikbibliothek für KDEs Digikam

- ###  3D-Grafik

- :x:  blender  --	Sehr schnelle und vielseitige Suite für 3D-Modellierung/-Rendering
- :+1:  makehuman  --	Modelling of 3-Dimensional humanoid characters - ab stretch
- :x:  sweethome3d  --	Interior 2D design application with 3D preview (java)
- :+1:  sweethome3d-furniture-editor  -- Sweet Home 3D Furniture Library Editor
- :+1:  sweethome3d-textures-editor  --  Sweet Home 3D Textures Library Editor

##  Education - Science  --  Bildung und Wissenschaft

- ###  mathematics

- :x:  octave  --	GNU Octave - Sprache für numerische Berechnungen
- :x:  octave-control
- :x:  geogebra  --	Dynamische Mathematiksoftware für die Lehre
- :o:  geogebra-gnome  -- GNOME-Integrationsebene für GeoGebra
- :x:  geogebra-kde  -- KDE integration layer for GeoGebra
- :x:  gnuplot  --	Kommandozeilengesteuertes, interaktives Plot-Programm
- :+1:  kmplot  --	Mathematischer Funktionsplotter für KDE
- :x:  fraqtive  -- Fraktalgenerator

- ###  scientific python

- :x:  ipython3  --  Erweiterte interaktive Python-3-Shell 
- :x:  jupyter-notebook  --  Jupyter projects for Python 3
- :x:  python3-sympy  --	Python-Computeralgebrasystem (CAS)

[//]: # ( - :o: :-1:  ipython3  -- Erweiterte interaktive Python-3-Shell )

[//]: # (	- IPython >> jupyter, sympy << wird über Extra-Installation bereitgestellt. Ist deutlich aktueller )

[//]: # ( - :+1: :x:  [jupyter] --  Jupyter projects for Python 3 )

[//]: # (	- Extra Installation da nicht im Repro verfügbar )

[//]: # ( - :+1: :x:  [sympy] --	Python-Computeralgebrasystem >> CAS << )

[//]: # (	- Extra Installation da nicht im Repro verfügbar )

[//]: # ( Carsten: IPython wird separat via HOOK installiert. Ist deutlich aktueller )

- :x:  python3-dev  -- Header (zum Kompilieren von Python-Paketen, wird vom Hook gebraucht)
- :x:  python3-setuptools  -- Werkzeuge zur Installation von Python-Paketen
- :x:  python-pip  -- Pythons eigener Paketmanager
- :x:  python3-pip  -- Pythons eigener Paketmanager
- :x:  python-numpy
- :x:  python3-numpy
- :x:  python-scipy
- :x:  python3-scipy
- :x:  python-matplotlib
- :x:  python3-matplotlib
- :x:  python3-tk
- :x:  python-tk
- :x:  python3-sphinx  -- Tool zur automatischen Erzeugung von Dokumentaion aus source-code

- ###  Statistik

- :x:  pspp  -- Statistik-Suite
- :x:  r-base  --	GNU R - ein System für statistische Berechnungen und Grafiken
- :x:  r-base-core  --	GNU R Statistik-Suite (nur das Grundsystem)
- :+1: :x:  [rstudio](https://download1.rstudio.org/rstudio-xenial-1.1.447-amd64.deb)  -- Frontend für R (Wunsch des FSR Psychologie)
- :+1:  littler  --	GNU R Konsolenfrontend
- :+1:  r-cran-zelig  -- GNU R package providing a unified front-end for estimating statistical models
- :+1:  r-cran-rcmdr  -- GNU R platform-independent basic-statistics GUI
- :+1:  r-doc-info  -- Info für Gnu-R

- ###  CAD

- :x:  freecad  -- umfangreiches und vielfältiges Konstruktionsprogramm
- :+1:  freecad-doc  -- Doku für FreeCad

- ###  chemistry

- :x:  kalzium  --	Periodensystem und Chemiewerkzeuge
- :x:  kalzium-data  -- Daten für kalzium
- :+1:  scilab  -- matrixbasierte Wissenschaftssoftwaresuite

- ###  languages

- :x:  kwordquiz  --	Lernkarten-Lernprogramm für KDE -- TODO: benötigt noch gut Vokabellisten für Latein, Englisch, Spanisch, Italienisch
- :x:  goldendict  --	Wörterbuch und Lexikon
- :+1:  goldendict-wordnet  -- optionales Wörterbuch für goldendict
- :o:  openteacher  -- eine weitere Sprachlernsoftware
- :x:  parley  -- Vokabeltrainer für den KDE-Desktop
- :+1:  anki  -- Vokabeltrainer mit Unterstützung von asiatischen Schriftzeichen, LaTeX, Audioaufnahmen und Bildern und optionaler Onlinesync

- ###  electronics

- :+1: :x:  [qucs](https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb)  --	Schaltungssimulation
	- Extra Installation da nicht im Repo verfügbar
	- Quelle: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb
	- Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl werden automatisch aufgelöst.

[//]: # (  - TODO: nicht in den offiziellen stable Quellen, gibt es aber hier: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb )
[//]: # (    - Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl )
[//]: # (    - Recommends: freehdl, verilog, octave )
[//]: # (    - Außerdem brauchen wir noch Beispiele )

- :+1:  kicad  -- 	Entwurf von Schaltplänen und Platinen
[//]: # (Dieses Paket zieht mit Kicad-common einen 420 MB Koloss als Abhängigkeit nach.)
- :+1:  kicad-doc-de  --
- :+1:  fritzing  --
- :+1:  pcb  --
- :+1:  qelectrotech  --
- :+1:  geda  --
- :+1:  geda-examples  --
- :+1:  geda-gsymcheck  --

- ###  Funksignalverarbeitung

- :o:  gnuradio  --	SoftwareDefinedRadio, Signalverarbeitung
- :o:  cutesdr  --	SoftwareDefinedRadio für Bildungszwecke
- :+1:  gqrx-sdr  --	SoftwareDefinedRadio mit größerer Hardwareunterstützung

- ###  geography

- :x:  marble  -- Schreibtischglobus mit Routingfunktion (über Pluginsystem erweiterbar)
- :o:  josm  -- OpenStreetmap-Editor
[//]: # (Machte zwar einen guten Eindruck, leider wird aber eine neuere Javaversion benötigt, als bei Debian Jessie vorgesehen ist)
- :o:  gosmore  -- OpenStreetmap-Frontend (Viewer mit Sprachausgabe)
[//]: # (Hat sich nicht so richtig bewähren können)

- ###  astronomy

- :x:  stellarium  -- Desktop-Planetarium (Himmelsansichten und Sternzeichen)
[//]: # (Dies zieht mit stellarium-data eine 112 MB großes Paket als Abhängigkeit nach)
- :+1:  celestia  -- Desktop-Planetarium (Fotorelistische Planetenansichten)

- ###  social-science

- :+1:  opensesame  -- Gui für Experimente aus dem sozialwissenschaftlichen Bereich

- ###  admin

- :x:  synaptic  -- Grafischer Paket-Verwalter
[//]: # (Carsten: Das ist meiner Meinung nach das benutzerfreundlichste Paketmanager-Frontend)

##  TexLive  -- LaTex Toolbox - Dokumenten Satzprogramm

- :x:  texlive  --
- :x:  texlive-base  --
- :x:  texlive-bibtex-extra  --
 - :x:  biber  --  Stark erweiterter BibTeX-Ersatz für Anwender von BibLaTeX (perl)
[//]: # (Carsten: biber ist notwendig für Daniels Vorlage)
- :x:  texlive-binaries  --
- :+1:  texlive-doc-de  --
- :x:  texlive-extra-utils  --		für pdfjam (pdf90)
- :x:  texlive-font-utils  --
- :x:  texlive-fonts-extra  -- Zusatzliche Schriftarten                     (Größe 599 MB das fetteste Paket von allen!)
- :+1:  texlive-fonts-extra-doc  --
- :x:  tex-gyre  -- 	Skalierbare PostScript- und OpenType-Schriften auf Basis der URW-Schriften
- :x:  texlive-fonts-recommended  --
- :+1:  texlive-fonts-recommended-doc  --
- :x:  texlive-formats-extra  --
- :x:  texlive-generic-recommended  --
- :x:  texlive-lang-german  --
- :x:  texlive-latex-base  --
- :+1:  texlive-latex-base-doc  --
- :x:  texlive-latex-extra  --		gut für Beamer-presentation
- :+1:  texlive-latex-extra-doc  -- Doku für texlive-latex-extra        (Größe 420 MB)
[//]: # (Dies dürfte die fetteste Doku sein! Leider wird sie von texlive-latex-extra automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-latex-recommended  --
- :+1:  texlive-latex-recommended-doc  --
- :x:  texlive-luatex  --
- :x:  texlive-math-extra  --
- :x:  texlive-pictures  --
- :+1:  texlive-pictures-doc  --
- :x:  texlive-plain-extra  --
- :x:  texlive-pstricks  --
- :+1:  texlive-pstricks-doc  --   Doku für texlive-publishers         (Größe 112 MB)
[//]: # (Wird leider von texlive-pstricks automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-publishers  --
- :+1:  texlive-publishers-doc  --  Doku für texlive-publishers         (Größe 113 MB)
[//]: # (Wird leider von texlive-publishers automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-xetex  --
- :x:  biber  --				Literaturverw.programm
- :x:  texstudio  --			LaTeX-Editor - GUI
- :+1:  texstudio-doc  --
- :x:  texstudio-l10n  --
- :+1:  kile  --				KDE basierter LaTeX-Editor
- :+1:  kile-doc  --
- :+1:  kile-l10n  --
- :+1:  klatexformula  -- grafischer Formeleditor für LaTeX
- :+1:  ktikz  -- grafischer TikZ-Editor für KDE


##  Programmierung Softwareentwicklung

- :x:  gfortran  -- GNU-Fortran-95-Compiler

- ###  Programmiersprache PHP

- :+1:  php5  -- PHP-Hauptpaket (zieht leider den Apache2 nach sich)
- :+1:  php5-cli  -- PHP-Konsolenschnittstelle
- :+1:  php5-gd  -- PHP5-Grafikbibliothek
- :+1:  php5-mysqlnd  -- PHP5-Datenbankbibliothek
- :+1:  php5-xdebug  -- praktisches Debugtool für PHP
- :+1:  phpunit  -- Unittests für PHP

- ###  Tools

- :x:  build-essential  --	Kompiler und diverse Bibliotheken (wichtig)
- :x:  gcc  --			GNU C Compiler
- :x:  g++  --			GNU C++ Compiler
- :x:  make  --			einfaches Build-Tool
- :x:  gdb-minimal  --		minmaler GNU-Debugger
- :x:  kdbg  --			Kde basiertes Frontend für den Gdb-Debugger
- :x:  golang  -- 		Compiler und toolchain zur Programmiersprache go

- :x:  default-jdk  -- Open Java Development Kit 7

- :x:  git  --		Schnelles, skalierbares, verteiltes Revisions-Kontroll-System
- :x:  git-gui  --	grafische Oberfläche für die Versionsverwaltung Git
- :+1:  gitg  --	weitere grafische Oberfläche für die Versionsverwaltung Git
- :x:  gitk  --		Schnelles, skalierbares, verteiltes Revisions-Kontrollsystem (Visualisierungsprogramm)
- :x:  doxygen-gui  --	Frontend des Doku-Generators
- :x:  doxygen-latex  -- Doxygen-LaTeX-Abhängigkeiten, falls LaTeX-Export gewünscht
- :x:  umbrello  --	einfaches UML-Tool für den KDE-Desktop

- ###  IDEs

- :+1:  geany  -- leichtgewichtiger Texteditor, der durch Plugins erweitert werden kann
- :+1:  geany-plugin-addons
- :+1:  geany-plugin-devhelp  -- API-Dokumentation beim Programmieren anzeigen lassen
- :+1:  geany-plugin-doc  -- weitere API-Dokumentationssuche
- :+1:  geany-plugin-gendoc  -- Doku-Generator für Geany (vgl. etwa Doxygen)
- :+1:  geany-plugin-latex  -- LaTeX-Plugin für Geany
[//]: # (Norman: Dies erscheint mir redundant, da bereits ein umfangreicherer LaTeX-Editor vorgesehen)
- :+1:  geany-plugin-markdown  -- Markdown- (und somit auch Pandoc-) Vorschaufenster für Geany
- :+1:  geany-plugin-pairtaghighlighter
- :+1:  geany-plugin-pg  -- GPG-Plugin für Geany zum Ver-/Entschlüsseln und digitalem Signieren
- :+1:  geany-plugin-prettyprinter  -- Geanyplugin für hübschere Ausdrucke
- :+1:  geany-plugin-spellcheck  -- Rechtschreibkorrektur für Geany
- :+1:  geany-plugin-vc  -- Geanyplugin für Versionsverwaltungen
- :+1:  geany-plugin-extrasel  -- Blockauswahlmodus für Geany
- :+1:  geany-plugin-projectorganizer  -- Projektverwaltungsplugin für Geany
- :+1:  jedit  -- weiterer Texteditor, der durch Plugins erweitert werden kann
- :o:  eclipse  -- vielseitiger, aber auch schwergewichtiger, Klassiker
- :o:  eclipse-cdt  -- Eclipse für C++ Programmierung
- :o:  eclipse-jdt  -- Eclipse für Java Programmierung
- :o:  eclipse-eclox  -- Doxygen-Plugin für Eclipse
- :o:  eclipse-egit  -- Git-Plugin für Eclipse
- :o:  qtcreator  -- IDE für C++ incl. QT-Framework
- :x:  scratch  -- spielerisch programmieren lernen
- :x:  squeak-plugins-scratch  -- spielerisch programmieren lernen (Erweiterung)
- :o:  netbeans  -- IDE für Webprogrammierung (Ist leider nicht im Repo)
- :x:  swi-prolog  -- deklaratives Programmieren
- :+1:  swi-prolog-doc
- :+1:  swi-prolog-java
- :+1:  swi-prolog-odbc
- :x:  arduino  -- Entwicklungswerkzeuge für den Anschluss von Arduino-Boards für Hobbybastler und andere

##  Datenbanken

- :x:  sqlite3  -- kleine leichtgewichtige SQL-Datenbank mit Konsolen-Frontend
- :x:  sqlitebrowser  -- grafisches Datenbankfrontend für Sqlite
- :o:  mysql-server  -- MySQL-Datenbankserver
- :o:  mysql-client  -- MySQL-Datenbankclient (Konsolenvariante)
- :o:  phpmyadmin  -- umfangreiches und lehrreiches MySQL-Webfrontend

##  Terminal Tools

- :x:  mc  --		Midnight Commander - ein guter Dateimanager
- :x:  vim  --		verbesserter vi-Editor
- :x:  vim-doc  --	HTML-Version der Online-Dokumentation	
- :+1:  vim-scripts  --	Erweiterungen für vim
- :x:  screen  --	Terminalmultiplexer mit VT100/ANSI-Terminalemulation
- :+1:  tmux  --	Terminal-Multiplexer 
- :+1:  sm  -- Zeigt einen kurzen Text bildschirmfüllend an
- :x:  silversearcher-ag  -- sehr schnell grep-ähnliches Programm
- :x:  htop  -- interaktive Prozessübersicht für die Konsole
- :x:  pandoc  -- Multiformatkonverter
- :x:  pandoc-citeproc  -- Literaturverwaltungserweiterung für Pandoc
- :x:  docutils-common  -- weiterer Multiformatkonverter (für Restructured Text)
- :x:  hopenpgp-tools  -- hOpenPGP-basierte Kommandozeilentools für digitale Signaturen (etwa für PDF-Dateien)

- ###  grafik

- :x:  dvipng  --	Konvertiert DVI-Dateien in PNG-Grafiken
- :x:  imagemagick  --	konsolenbasierte Bildbearbeitungsprogramme - gut in Skripten zu verwenden z.B.: um ganze Bilderordner zu konvertieren
- :x:  graphviz  --	umfangreiches Graphenerstellungstool, das häufig in Skripten verwendet wird

- ###  utils

- :x:  bash-completion  -- Programmierbare Vervollständigung für die Bash-Shell
- :x:  console-setup  -- Programm zur Einstellung von Schriftart und Tastaturbelegung für die Konsole
- :x:  usbutils  --	Linux USB-Hilfsprogramme
- :x:  pciutils  --	PCI-Hilfsprogramme
- :x:  lshw  --		Informationen über die Hardwarekonfiguration
- :x:  lsdvd  --	liest die Inhaltsinformation einer DVD
- :x:  eject  --	Auswerfen von CDs und Steuern von CD-Wechslern unter Linux
- :x:  udisks2  --	D-Bus-Dienst für Zugriff auf und Manipulation von Speichergeräten
- :x:  sshfs  --	Dateisystemclient, der auf dem SSH-Dateiübertragungsprotokoll basiert
- :x:  pm-utils  --	Powermanagement
- :x:  testdisk  --	Datenrettungswerkzeug
- :x:  dosfstools  --	Programme zum Anlegen und Überprüfen von MS-DOS-FAT-Dateisystemen

- :x:  cups  --		Common UNIX Printing System(tm) - PPD-/Treiber-Unterstützung, Webschnittstelle
- :x:  cups-bsd  --	Common UNIX Printing System(tm) - BSD-Befehle

[//]: # (Carsten: printer-driver-cups-pdf will während des Bauens ein root-Passwort eingegeben haben)
- :-1:  printer-driver-cups-pdf  -- Drucker Treiber zur PDF-Erzeugung

- ###  text 

- :x:  most  --		Pager-Programm - alternativ zu more / less

- ###  admin

- :x:  dselect  --	Oberfläche für die Debian-Paketverwaltung
- :x:  fbset  --	Framebuffer-Geräte einstellen
- :x:  hdparm  --	Festplattenparameter einstellen
- :x:  localepurge  --	Freigeben von Festplattenplatz durch Entfernen nicht benötigter Lokalisierungen
- :x:  cryptsetup  --	Unterstützung für Festplattenverschlüsselung - Startskripte
- :x:  gdisk  --	Textmodus-Partitionierungswerkzeug GPT fdisk
- :x:  locate  --	schnell nach Dateien auf der Platte suchen

- ###  kernel

- :x:  squashfs-tools  -- Werkzeug zum Erzeugen und Hinzufügen von squashfs-Dateisystemen

##  German User  -- System Tools - Deutsche Sprachpakete

- ###  task-german

- :x:  manpages-de  --
- :x:  wngerman  --
- :x:  ingerman  --
- :x:  aspell-de  --
- :x:  aspell-de-alt  --
- :+1:  hunspell  -- weitere Rechtschreibkorrektur

- :x:  util-linux-locales  --
- :x:  gettext  --		GNU-Internationalisierungswerkzeuge

## fonts

- :x:  ttf-bitstream-vera  --	Die TrueType-Schriftfamilie Bitstream Vera
- :x:  fonts-dejavu  --		Vera-Schriftartfamile mit zusätzlichen Zeichen
- :x:  fonts-texgyre  --	OpenType-Schriften auf Basis der URW-Schriften
- :x:  fonts-liberation  --	Schriften mit den gleichen Metriken wie Times, Arial und Courier
- :x:  fonts-lmodern  --	OpenType-Schriften auf Grundlage von Computer Modern
- :x:  fonts-freefont-ttf  --	Freefont-TrueType-Schriften Serif, Sans und Mono
- :x:  fonts-freefont-otf  --	Freefont Serif, Sans and Mono OpenType fonts

##  SystemTools - Virtualisierung - Netzwerk

- :o:  gpart  -- Partitionierungsprogramm (Konsolenvariante)
- :o:  gparted  -- Partitionierungsprogramm (Frontend)
- :+1:  discover  -- grafische, einfach gehaltene, Softwareverwaltung
- :x:  installation-report  -- Hilfstool für Bugreports
- :x:  reportbug  -- Hilfstool für Bugreports
- :x:  python-vte  -- Gui-Bibliothek für reportbugs
- [x]  openssh-server  -- Ermöglicht Zugriff von Außen, hilfreich für die Entwicklung des Live-Systems

- ###  Virtualisierung

- :x:  qemu-kvm  --	Vollständige Virtualisierung auf x86-Hardware
- :+1:  virt-manager  -- mächtiges Virtualisierungsprogramm
- :x:  virtualbox  -- einfach zu bedienendes Virtualisierungsprogramm
- :x:  virtualbox-guest-utils
- :x:  virtualbox-guest-x11

- ###  Netzwerk

- :x:  wireshark  -- Netzwerkanalysetool
- :x:  traceroute  -- Netzwerkanalysetool
- :x:  netcat-traditional  -- 		Unix-Programm, das über Netzwerkverbindungen per TCP oder UDP Daten liest und schreibt
- :x:  network-manager-openvpn  --	Verwaltung von Netzwerken OpenVPN-Erweiterung
- :x:  network-manager-pptp  --		Verwaltung von Netzwerken PPTP-Erweiterung (Point-to-Point Tunneling Protocol)
- :x:  network-manager-vpnc  --		Verwaltung von Netzwerken VPNC-Erweiterung (Cisco-kompatibler VPN-Client)
- :x:  modem-manager-gui  --		GUI front-end for ModemManager / Wader / oFono
- :x:  usb-modeswitch  -- 		Werkzeug für Modiwechsel zum Steuern von USB-Geräten mit Flipflopschaltung
- :x:  usbmuxd  -- 		USB-Multiplexer-Daemon für iPhone- und iPod-Touch-Geräte

- ###  Wlan - Hardware

- :x:  crda  --		Central Regulatory Domain Agent für kabellose Geräte
 - :x:  iw  --		Werkzeug für die Konfiguration von drahtlosen Linux-Geräten (WiFi /WLAN)
- :x:  rfkill  --	Wlan, Bluetooth & Co. an-/ abschalten
- :x:  wireless-tools  --	zum Bearbeiten von WLAN Einstellungen

- [ ]  firmware-b43-installer  -- installiert die Broadcom 43xx WLAN Karten Firmware
[//]: # (Carsten: Ist das nur der Installer, oder der komplette Treiber?)
[//]: # (Gerd: installiert den Firmwareteil der Treiber)

- :x:  firmware-linux-free  --
- :o:  firmware-b43-installer  --
- :o:  firmware-iwlwifi  -- wird von Thinkpads (getestet mit einem T420) gebraucht

##  live  -- System Pakete werden fürs Live-System benöttigt

- :x:  live-boot  --
 - :x:  live-boot-initramfs-tools  -- hinzugefügt stretch
 - :x:  live-tools  --
 - :x:  rsync  --
 - :x:  uuid-runtime  --
- :x:  live-config  --
 - :x:  live-config-systemd  --
 - :o:  iproute2  --

##  recommends  -- Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- :x:  user-setup  --
- :x:  sudo  --

- :x:  dbus  --
- :x:  irqbalance  -- 
- :x:  ixo-usb-jtag  --
- :x:  keyboard-configuration  -- 
- :x:  libglib2.0-data  -- 
- :x:  locales  --
- :x:  sgml-base  --
- :x:  shared-mime-info --
- :x:  xdg-user-dirs  --
- :x:  xml-core  --

##  firmware  -- wird > lb config --firmware-chroot false < verwendet, fehlen diese Pakete

- :o:  firmware-linux  --
 - :x:  firmware-linux-free  -- 
 - :o:  firmware-linux-nonfree  --
  - :x:  firmware-misc-nonfree  --  Binäre Firmware für verschiedene Treiber im Linux-Kernel z.B.: i915, Intel, Nvidia, Ralink ... 
  - :o:  firmware-amd-graphics  -- 

- :x:  hdmi2usb-fx2-firmware  --

- :o:  dahdi-firmware-nonfree  --

- :o:  bluez-firmware  --
- :o:  atmel-firmware  --
- :o:  amd64-microcode  --
- :o:  intel-microcode  --

- :o:  firmware-atheros  -- 
- :o:  firmware-bnx2  -- 
- :o:  firmware-bnx2x  -- 
- :o:  firmware-brcm80211  -- 
- :o:  firmware-cavium  -- 
- :o:  firmware-crystalhd  -- 
- :o:  firmware-intel-sound  -- 
- :o:  firmware-intelwimax  -- 
- :o:  firmware-ipw2x00  -- 
- :o:  firmware-ivtv  -- 
- :o:  firmware-iwlwifi  -- 
- :o:  firmware-libertas  -- 
- :o:  firmware-myricom  -- 
- :o:  firmware-netxen  -- 
- :o:  firmware-qlogic  -- 
- :o:  firmware-realtek  -- 
- :o:  firmware-samsung  -- 
- :o:  firmware-siano  -- 
- :o:  firmware-ti-connectivity  -- 
- :o:  firmware-zd1211  -- 


