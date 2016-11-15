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
> - :+1: :x:  [Paket vorschlag] (http://download-path-paket.deb)  -- ist leider nicht in den Repros verfügbar, wird aber alternativ installiert
>		- Beschreibung / Erklärungen 
>		- Extra Installation da nicht im Repro verfügbar
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
> #### Versionen für Programme angeben ####
> 
> Es ist möglich anzugeben ob ein Programm aus Debians Stable- oder Testing- Repo installiert werden soll
>
> Beispiel:
> * `zim/stable` installiert das Programm *Zim* in Version 0.62 aus dem Stable-Repo (also aktuell Debian Jessie)
> * `zim/testing` installiert das Programm *Zim* in Version 0.65 aus dem Testing-Repo (also aktuell Debian Stretch)
>
> Wenn kein wichtiger Grund besteht, sollte möglichst immer *stable* verwendet werden.
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

- :o:  task-desktop/stable  -- Grafische Desktop Umgebung - Progamm Sammlung
 - :x:  xserver-xorg/stable  -- 
 - :x:  xserver-xorg-video-all/stable  -- alle Grafik-Treiber (10 MB)
 - :x:  gsfonts-x11/stable  --
  - :o:  xfonts-utils/stable  --
.- :x:  xdg-user-dirs/stable  --	Werkzeug zur Verwaltung von Benutzerordnern

- :o:  desktop-base/stable  -- Allgemeine Dateien für den Debian-Desktop - schlägt gnome vor

- ###  task-kde-desktop  -- KDE Desktop Umgebung

- :x:  kdm/stable  --		KDE-Displaymanager für X11

- ###  kde-standard

- :x:  akregator/stable  --	RSS/Atom-Feed-Aggregator 
- :x:  ark/stable  --		Archiv-Werkzeug 
- :x:  dragonplayer/stable  --	Einfacher Videoabspieler 
- :x:  gwenview/stable  --	Bildbetrachter 
- :x:  juk/stable  --		Jukebox und Musikabspieler 
- :x:  kaddressbook/stable  --	Adressbuch- und Kontaktdatenverwaltung 
- :x:  kate/stable  --		Leistungsstarker Texteditor 
- :x:  kcalc/stable/stable  --	Einfacher wissenschaftlicher Taschenrechner 
- :x:  khelpcenter4/stable  --	Hilfezentrum 
- :x:  kmail/stable  --	Vollständiger grafischer E-Mail-Client
[//]: # (Carsten: bei kmail wäre zu überlegen, ob man es nicht weglässt. icedove (bzw. vorzugsweise thunderbird) ist ohnehin gesetzt. Alles weitere verwirrt nur.)
- :x:  kmix/stable  --		Lautstärkeregler und Mischer 
- :x:  knotes/stable  --	Programm für Haftnotizen (sticky notes) 
- :x:  kopete/stable  --	Instant-Messaging- und Chat-Anwendung 
- :x:  korganizer/stable  --	Kalender und persönliche Terminverwaltung 
- :x:  kscreensaver/stable  --	Zusätzliche Bildschirmschoner für KScreenSaver 
- :x:  ksnapshot/stable  --	Werkzeug für die Erstellung von Bildschirmfotos 
- :x:  kwalletmanager/stable  -- Sichere Passwortverwaltung 
- :x:  okular/stable  --	Universal-Dokumentenbetrachter 
- :x:  okular-extra-backends/stable  --  Unterstützung von zusätzlichen Dokumentformaten für Okular 
- :x:  polkit-kde-1/stable  --	KDE-Dialoge für PolicyKit 
- :x:  sweeper/stable  --	Löschen von Verlauf und temporären Dateien 
- :x:  freespacenotifier/stable  -- KDE-Modul zur Benachrichtigung bei Platzmangel 
- :x:  konq-plugins/stable  --	Erweiterungen für Konqueror, den KDE-Datei-/Web-/Dokumenten-Browser 
- :x:  kdeplasma-addons/stable  -- Plasma-Erweiterungen 
- :x:  kde-plasma-desktop/stable  -- KDE Plasma Desktop und eine minimale Auswahl an Anwendungen - oder ...netbook
- :x:  kde-plasma-netbook/stable  -- KDE Plasma Netbook und eine minimale Auswahl an Anwendungen - oder ...desktop
- :x:  plasma-desktopthemes-artwork/stable  -- Desktop Themes für KDE Plasma Workspaces 
- :x:  plasma-widget-networkmanagement/stable  -- Transitional package for plasma-nm
- :x:  plasma-scriptengines/stable  --	install all Plasma script engines 
 
- :x:  skanlite/stable  --	Auf dem KSane-Backend basierendes Scanprogramm für KDE 4 
- :x:  kontact/stable  --	    Integrierte Anwendung für die Verwaltung persönlicher Informationen
- :x:  konsolekalendar/stable  -- Persönlicher Organizer für die Konsole
- :+1:  kteatime/stable  -- Kurzzeitwecker, damit der Tee weder zu kurz och zu lange zieht
- :+1:  ktimetracker/stable  -- Zeiterfassungstool zur Unterstützung bei der Zeiteinteilung

- :x:  kdiff3/stable  -- Vergleicht und führt zwei oder drei Dateien oder Verzeichnisse zusammen 
- :x:  kdesudo/stable  -- sudo-Oberfläche für KDE
- :x:  partitionmanager/stable  -- 	KDE-Programm zur Verwaltung von Dateien, Platten und Partitionen
- :x:  filelight/stable  -- Speicherbelegungsvisualisierung
  - :o:  kde-wallpapers/stable  -- Hintergrundbilder für den KDE-Desktop          (Größe 90 MB)
[//]: # (Dieses Paket scheint eine Abhängigkeit zu sein, das automatisch mit installiert wird, auch wenn es hier garnicht zum Installieren ausgewählt wurde.)

- ###  kde-l10n  -- virtuelles Paket zur Sprachenunterstützung

- :x:  kde-l10n-de/stable  --	Deutsche (de) Lokalisierung für KDE

- ### :x:  task-mate-desktop  -- [Mate Desktop Umgebung] (task-mate-desktop.md)
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption (kvm -m 1024) benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption (kvm -m 256), für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )

- ### :o:  task-gnome-desktop/stable  -- 

- ### :o:  task-xfce-desktop/stable  --

- ### :o:  task-cinnamon-desktop/stable  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :x:  Accessibility-Paketliste  -- [Software zur Barrierereduzierung] (Accessibility-Paketliste.md)
 
- ### 

##  Desktop office  -- Büroprogramme - Textverarbeitung - Tabellenkalkulation etc.

- ###  Textverarbeitung

- :o:  vim-gtk/stable  --	verbessserter vi-Editor - mit GTK2-Oberfläche
- :x:  zim/stable  -- Desktopwiki, welches durch Plugins erweitert werden kann

- ###  libreoffice

- :x:  libreoffice-base/stable  --	Datenbank
- :x:  libreoffice-calc/stable  --	Tabellenkalkulation
- :x:  libreoffice-math/stable  --	Formel-Editor
- :x:  libreoffice-dmaths/stable  --	Verbesserungen für den LibreOffice-Formeleditor
- :x:  libreoffice-draw/stable  --	Zeichenprogramm
- :+1:  libreoffice-help-de/stable  --	Deutsche Hilfe
- :x:  libreoffice-l10n-de/stable  --	Deutsches Sprachpaket 
- :+1:  libreoffice-java-common/stable  -- Java-Unterstützung fürs (Zotero-)Plugin
[//]: # ( erfordert zwingend die Version 1:4.3.3.2, also jener von Debian Jessie)

- ###  PDF-Tools

- :x:  pdftk/stable  --	Werkzeug für die Manipulation von PDF-Dokumenten - benötigt Java runtime
- :x:  diffpdf/stable  --	grafischer PDF-Vergleicher
- :x:  xournal/stable  --	GTK+-Anwendung für Notizen -- auch in *.pdf
- :x:  pdfgrep/stable  --	grep-artiges Suchprogramm für PDF-Dateien für die Konsole
- :x:  pdfmod/stable  --	PDF-Bearbeitungsfrontend
- :x:  pdfresurrect/stable  -- zeigt Überarbeitungen in PDF-Dateien, falls vorhanden
- :x:  pdfchain/stable  --	Grafische Benutzeroberfläche für das PDF Tool Kit

- ###  Literaturverwaltung

- :x:  jabref/stable  -- umfangreiche Literatur- und Quellenverwaltung (javabasiert)
- :x:  jabref-plugin-oo/stable  -- Jabref-Plugin für LibreOffice
- :+1:  docear/stable  -- Literaturverw. per Mindmap (leider nicht in den Repos sondern nur auf <www.docear.org>)
- :+1:  kbibtex/stable  -- Kde basierte Literaturverwaltung
- :+1:  utopia-documents/stable  -- PDF-Viewer mit der Möglichkeit seine Annotationen Online zu teilen
- :+1:  referencer/stable  -- einfache Literaturverwaltung für den Gnomedesktop
- :+1:  libreoffice-zotero-integration/stable  -- Zotero-Plugin für LibreOffice
[//]: # (stammt aus Debians testing-Repo und benötigt zwingend LibreOffice-java-common in der Version von Debian stable also 1:4.3.3.2)
- :x:  xul-ext-zotero/testing  -- Zotero-Plugin für Firefox
[//]: # (stammt aus Debians testing-Repo)

- ###  kommunikation

- :x:  firefox-esr/stable  --	Mozilla Firefox Webbrowser               (Größe 100 MB)
- :x:  firefox-esr-l10n-de/stable  -- Deutsches Sprachpaket für den Firefox

- :+1:  evolution/stable  --	 Groupware-Suite mit E-Mail-Client und Organizer
- :x:  icedove/stable  --	E-Mail- und News-Client mit RSS-Unterstützung, Kalender, Adressbuch und integriertem Spam-Filter         (Größe 102 MB)
[//]: # (Carsten: Wie viel Aufwand macht es das Programm als Thunderbird mit "Original-Logo" zu installieren? Sollte doch Lizenzrechtlich möglich sein. Bei Ubuntu geht es ja auch. Hintergrund: Möglichst wenig Verwirrung stiften. Außerdem läuft Icedove 45.2.0 aus debian stable bei mir nicht besonders stabil.)
[//]: # (Gerd: icedove entspricht Thunderbird Version 45.2.0 -- muss jemand testen - kann sein das enigmail unkompatible mit dem PGP-Agent ist ? )
- :x:  icedove-l10n-de/stable  --
- :x:  enigmail/stable  --	GPG-Unterstützung für Thunderbird und Debian Icedove

- :x:  pidgin/stable  --	Grafischer Instant-Messaging-Client
- :x:  pidgin-encryption/stable  -- Pidgin-Erweiterung, die transparente Verschlüsselung bietet
- :x:  pidgin-otr/stable  --	Pidgin-Erweiterung für Off-the-Record Messaging 

##  Desktop Video - Audio - Bilder - 3D

- ###  Audio

- :x:  audacity/stable  --	Schneller, plattformunabhängiger Audio-Editor 
- :x:  transcriber/stable  -- Programm zum Transkripieren (z.B. von Interviews)

- ###  Video

- :x:  vlc/stable  --		Multimedia-Player und Streamer
- :o:  pitivi/stable  -- Videoschnitt (entweder Pitivi oder Kdenlive)
- :o:  kdenlive/stable  -- Videoschnitt
- :o:  subtitlecomposer/stable  -- Untertiteleditor
- :+1:  winff-qt/stable  -- Videoformatkonverter


##  Desktop Grafik

- :x:  dia/stable  -- umfangreiches Diagrammerstellungsprogramm
- :+1:  geeqie/stable  --	Bildbetrachtung - Bildvorschau - Diashow -- verwendet GTK+
- :x:  inkscape/stable  --	Vektorbasiertes Zeichenprogramm
- :x:  sozi/stable  -- Inkscape-Plugin für kreative Präsentationen
- :x:  gimp/stable  --		Das GNU-Bildbearbeitungsprogramm
- :+1:  gimp-data-extras/stable  -- Ein extra Satz Pinsel, Paletten, Gradienten für GIMP
- :x:  gimp-dcraw/stable  --	GIMP-Erweiterung zum Laden von RAW-Digitalfotos		-- kollidiert mit gimp-ufraw
- :o:  gimp-ufraw/stable  --	Gimp Importierprogramm für Kamerabilder im raw-Format
- :o:  gimp-help-de/stable  --	Dokumentation für GIMP (Deutsch) - in stretch (testing)
- :o:  darktable/stable  --	Virtueller Leuchttisch und virtuelle Dunkelkammer für Fotografen 
- :x:  rawtherapee/stable  --	Umwandler für RAW-Bilder und Bearbeitungssoftware für Digitalfotos
- :x:  icc-profiles-free/stable  -- Freie Farbprofile für die Kompatibilität mit den Farbverwaltungen anderer Grafikprogramme
- :x:  scribus/stable  --	DTP-Programm
- :+1:  scribus-template/stable  -- Vorlagen
- :x:  xsane/stable  --	Grafische Oberfläche für SANE (Scanner Access Now Easy) mit vielen Fähigkeiten

- ###  Fotoverwaltung

- :x:  digikam/stable  -- Full-Featured Fotoverwaltung für KDE
- :+1:  digikam-doc/stable  --
- :+1:  kipi-plugins/stable  -- Grafikbibliothek für KDEs Digikam

- ###  3D-Grafik

- :x:  blender/stable  --	Sehr schnelle und vielseitige Suite für 3D-Modellierung/-Rendering
- :+1:  makehuman/stable  --	Modelling of 3-Dimensional humanoid characters - ab stretch
- :x:  sweethome3d/stable  --	Interior 2D design application with 3D preview (java)
- :+1:  sweethome3d-furniture-editor/stable  -- Sweet Home 3D Furniture Library Editor
- :+1:  sweethome3d-textures-editor/stable  --  Sweet Home 3D Textures Library Editor

##  Education - Science  --  Bildung und Wissenschaft

- ###  mathematics

- :x:  octave/stable  --	GNU Octave - Sprache für numerische Berechnungen
- :x:  octave-control/stable  -- 
- :x:  geogebra/stable  --	Dynamische Mathematiksoftware für die Lehre
- :o:  geogebra-gnome/stable  -- GNOME-Integrationsebene für GeoGebra 
- :x:  geogebra-kde/stable  -- KDE integration layer for GeoGebra 
- :x:  gnuplot/stable  --	Kommandozeilengesteuertes, interaktives Plot-Programm 
- :+1:  kmplot/stable  --	Mathematischer Funktionsplotter für KDE
- :x:  fraqtive/stable  -- Fraktalgenerator

- ###  scientific python

- :o: :-1:  ipython3/stable  -- Erweiterte interaktive Python-3-Shell
	- IPython (jupyter, sympy) wird über Extra-Installation bereitgestellt. Ist deutlich aktueller
- :+1: :x:  [jupyter] ( )  --  Jupyter projects for Python 3
	- Extra Installation da nicht im Repro verfügbar
- :+1: :x:  [sympy] ( )  --	Python-Computeralgebrasystem (CAS)
	- Extra Installation da nicht im Repro verfügbar
[//]: # (Carsten: IPython wird separat via HOOK installiert. Ist deutlich aktueller)

- :x:  python3-dev/stable  -- Header (zum kompilieren von Python-Paketen, wird vom Hook gebraucht)
- :x:  python-pip/stable  -- Pythons eigener Paketmanager
- :x:  python3-pip/stable  -- Pythons eigener Paketmanager
- :x:  python-numpy/stable  -- 
- :x:  python3-numpy/stable  -- 
- :x:  python-scipy/stable  -- 
- :x:  python3-scipy/stable  -- 
- :x:  python-matplotlib/stable  -- 
- :x:  python3-matplotlib/stable  -- 
- :x:  python3-tk/stable  -- 
- :x:  python-tk/stable  -- 

- ###  Statistik

- :x:  pspp/stable  -- Statistik-Suite
- :o:  r-base/stable  --	GNU R - ein System für statistische Berechnungen und Grafiken
- :x:  r-base-core/stable  --	GNU R Statistik-Suite (nur das Grundsystem)
- :+1:  littler/stable  --	GNU R Konsolenfrontend
- :+1:  r-cran-zelig/stable  -- GNU R package providing a unified front-end for estimating statistical models
- :+1:  r-cran-rcmdr/stable  -- GNU R platform-independent basic-statistics GUI
- :+1:  r-doc-info/stable  -- Info für Gnu-R

- ###  CAD

- :x:  freecad/stable  -- umfangreiches und vielfältiges Konstruktionsprogramm
- :+1:  freecad-doc/stable  -- Doku für FreeCad

- ###  chemistry

- :x:  kalzium/stable  --	Periodensystem und Chemiewerkzeuge
- :x:  kalzium-data/stable  -- Daten für kalzium
- :+1:  scilab/stable  -- matrixbasierte Wissenschaftssoftwaresuite

- ###  languages

- :x:  kwordquiz/stable  --	Lernkarten-Lernprogramm für KDE -- TODO: benötigt noch gut Vokabellisten für Latein, Englisch, Spanisch, Italienisch
- :x:  goldendict/stable  --	Wörterbuch und Lexikon
- :+1:  goldendict-wordnet/stable  -- optionales Wörterbuch für goldendict
- :o:  openteacher/stable  -- eine weitere Sprachlernsoftware
- :x:  parley/stable  -- Vokabeltrainer für den KDE-Desktop
- :+1:  anki/stable  -- Vokabeltrainer mit Unterstützung von asiatischen Schriftzeichen, LaTeX, Audioaufnahmen und Bildern und optionaler Onlinesync

- ###  electronics

- :+1: :x:  [qucs] (https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb)  --	Schaltungssimulation
	- Extra Installation da nicht im Repro verfügbar
	- Quelle: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb 
	- Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl werden automatisch aufgelöst.
[//]: # (  - TODO: nicht in den offiziellen stable Quellen, gibt es aber hier: https://launchpad.net/~qucs/+archive/ubuntu/qucs/+files/qucs_0.0.18-2_amd64.deb )
[//]: # (    - Abhängigkeiten: libc6 libgcc1 libqt4-qt3support libqt4-script libqt4-svg libqtcore4 libqtgui4 libstdc++6 perl )
[//]: # (    - Recommends: freehdl, verilog, octave )
[//]: # (    - Außerdem brauchen wir noch Beispiele )

- :+1:  kicad/stable  -- 	Entwurf von Schaltplänen und Platinen
[//]: # (Dieses Paket zieht mit Kicad-common einen 420 MB Koloss als Abhängigkeit nach.)
- :+1:  kicad-doc-de/stable  -- 
- :+1:  fritzing/stable  --
- :+1:  pcb/stable  --
- :+1:  qelectrotech/stable  --
- :+1:  geda/stable  --
- :+1:  geda-examples/stable  --
- :+1:  geda-gsymcheck/stable  --

- ###  Funksignalverarbeitung

- :o:  gnuradio/stable  --	SoftwareDefinedRadio, Signalverarbeitung
- :o:  cutesdr/stable  --	SoftwareDefinedRadio für Bildungszwecke
- :+1:  gqrx-sdr/stable  --	SoftwareDefinedRadio mit größerer Hardwareunterstützung

- ###  geography

- :x:  marble/stable  -- Schreibtischglobus mit Routingfunktion (über Pluginsystem erweiterbar)
- :o:  josm/stable  -- OpenStreetmap-Editor
[//]: # (Machte zwar einen guten Eindruck, leider wird aber eine neuere Javaversion benötigt, als bei Debian Jessie vorgesehen ist)
- :o:  gosmore/stable  -- OpenStreetmap-Frontend (Viewer mit Sprachausgabe)
[//]: # (Hat sich nicht so richtig bewähren können)

- ###  astronomy

- :x:  stellarium/stable  -- Desktop-Planetarium (Himmelsansichten und Sternzeichen)
[//]: # (Dies zieht mit stellarium-data eine 112 MB großes Paket als Abhängigkeit nach)
- :+1:  celestia/stable  -- Desktop-Planetarium (Fotorelistische Planetenansichten)

- ###  social-science

- :+1:  opensesame/stable  -- Gui für Experimente aus dem sozialwissenschaftlichen Bereich

- ###  admin

- :x:  synaptic/stable  -- Grafischer Paket-Verwalter
[//]: # (Carsten: Das ist meiner Meinung nach das benutzerfreundlichste Paketmanager-Frontend)

##  TexLive  -- LaTex Toolbox - Dokumenten Satzprogramm 

- :x:  texlive/stable  --
- :x:  texlive-base/stable  --
- :x:  texlive-bibtex-extra/stable  --
 - :x:  biber/stable  --  Stark erweiterter BibTeX-Ersatz für Anwender von BibLaTeX (perl)
[//]: # (Carsten: biber ist notwendig für Daniels Vorlage)
- :x:  texlive-binaries/stable  --
- :+1:  texlive-doc-de/stable  --
- :x:  texlive-extra-utils/stable  --		für pdfjam (pdf90)
- :x:  texlive-font-utils/stable  --
- :x:  texlive-fonts-extra/stable  -- Zusatzliche Schriftarten                     (Größe 599 MB das fetteste Paket von allen!)
- :+1:  texlive-fonts-extra-doc/stable  --
- :x:  tex-gyre/stable  -- 	Skalierbare PostScript- und OpenType-Schriften auf Basis der URW-Schriften
- :x:  texlive-fonts-recommended/stable  --
- :+1:  texlive-fonts-recommended-doc/stable  --
- :x:  texlive-formats-extra/stable  --
- :x:  texlive-generic-recommended/stable  --
- :x:  texlive-lang-german/stable  --
- :x:  texlive-latex-base/stable  --
- :+1:  texlive-latex-base-doc/stable  --
- :x:  texlive-latex-extra/stable  --		gut für Beamer-presentation
- :+1:  texlive-latex-extra-doc/stable  -- Doku für texlive-latex-extra        (Größe 420 MB)
[//]: # (Dies dürfte die fetteste Doku sein! Leider wird sie von texlive-latex-extra automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-latex-recommended/stable  --
- :+1:  texlive-latex-recommended-doc/stable  --
- :x:  texlive-luatex/stable  --
- :x:  texlive-math-extra/stable  --
- :x:  texlive-pictures/stable  --
- :+1:  texlive-pictures-doc/stable  --
- :x:  texlive-plain-extra/stable  --
- :x:  texlive-pstricks/stable  --
- :+1:  texlive-pstricks-doc/stable  --   Doku für texlive-publishers         (Größe 112 MB)
[//]: # (Wird leider von texlive-pstricks automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-publishers/stable  --
- :+1:  texlive-publishers-doc/stable  --  Doku für texlive-publishers         (Größe 113 MB)
[//]: # (Wird leider von texlive-publishers automatisch nachgezogen, auch wenn man das garnicht möchte.)
- :x:  texlive-xetex/stable  --
- :x:  biber/stable  --				Literaturverw.programm
- :x:  texstudio/stable  --			LaTeX-Editor - GUI
- :+1:  texstudio-doc/stable  --
- :x:  texstudio-l10n/stable  --
- :+1:  kile/stable  --				KDE basierter LaTeX-Editor
- :+1:  kile-doc/stable  --
- :+1:  kile-l10n/stable  --
- :+1:  klatexformula/stable  -- grafischer Formeleditor für LaTeX
- :+1:  ktikz/stable  -- grafischer TikZ-Editor für KDE


##  Programmierung Softwareentwicklung

- :x:  gfortran/stable  -- GNU-Fortran-95-Compiler 

- ###  Programmiersprache PHP

- :+1:  php5/stable  -- PHP-Hauptpaket (zieht leider den Apache2 nach sich)
- :+1:  php5-cli/stable  -- PHP-Konsolenschnittstelle
- :+1:  php5-gd/stable  -- PHP5-Grafikbibliothek
- :+1:  php5-mysqlnd/stable  -- PHP5-Datenbankbibliothek
- :+1:  php5-xdebug/stable  -- praktisches Debugtool für PHP
- :+1:  phpunit/stable  -- Unittests für PHP

- ###  Tools

- :x:  build-essential/stable  --	Kompiler und diverse Bibliotheken (wichtig)
- :x:  gcc/stable  --			GNU C Compiler
- :x:  g++/stable  --			GNU C++ Compiler
- :x:  make/stable  --			einfaches Build-Tool
- :x:  gdb-minimal/stable  --		minmaler GNU-Debugger
- :x:  kdbg/stable  --			Kde basiertes Frontend für den Gdb-Debugger

- :x:  default-jdk/stable  -- Open Java Development Kit 7

- :x:  git/stable  --		Schnelles, skalierbares, verteiltes Revisions-Kontroll-System
- :x:  git-gui/stable  --	grafische Oberfläche für die Versionsverwaltung Git
- :+1:  gitg/stable  --	weitere grafische Oberfläche für die Versionsverwaltung Git
- :x:  gitk/stable  --		Schnelles, skalierbares, verteiltes Revisions-Kontrollsystem (Visualisierungsprogramm) 
- :x:  doxygen-gui/stable  --	Frontend des Doku-Generators
- :x:  doxygen-latex/stable  -- Doxygen-LaTeX-Abhängigkeiten, falls LaTeX-Export gewünscht
- :x:  umbrello/stable  --	einfaches UML-Tool für den KDE-Desktop

- ###  IDEs

- :+1:  geany/stable  -- leichtgewichtiger Texteditor, der durch Plugins erweitert werden kann
- :+1:  geany-plugin-addons/stable  --   
- :+1:  geany-plugin-devhelp/stable  -- API-Dokumentation beim Programmieren anzeigen lassen
- :+1:  geany-plugin-doc/stable  -- weitere API-Dokumentationssuche
- :+1:  geany-plugin-gendoc/stable  -- Doku-Generator für Geany (vgl. etwa Doxygen)
- :+1:  geany-plugin-latex/stable  -- LaTeX-Plugin für Geany
[//]: # (Norman: Dies erscheint mir redundant, da bereits ein umfangreicherer LaTeX-Editor vorgesehen)
- :+1:  geany-plugin-markdown/stable  -- Markdown- (und somit auch Pandoc-) Vorschaufenster für Geany
- :+1:  geany-plugin-pairtaghighlighter/stable  --   
- :+1:  geany-plugin-pg/stable  -- GPG-Plugin für Geany zum Ver-/Entschlüsseln und digitalem Signieren
- :+1:  geany-plugin-prettyprinter/stable  -- Geanyplugin für hübschere Ausdrucke
- :+1:  geany-plugin-spellcheck/stable  -- Rechtschreibkorrektur für Geany
- :+1:  geany-plugin-vc/stable  -- Geanyplugin für Versionsverwaltungen
- :+1:  geany-plugin-extrasel/stable  -- Blockauswahlmodus für Geany
- :+1:  geany-plugin-projectorganizer/stable  -- Projektverwaltungsplugin für Geany
- :+1:  jedit/stable  -- weiterer Texteditor, der durch Plugins erweitert werden kann
- :o:  eclipse/stable  -- vielseitiger, aber auch schwergewichtiger, Klassiker
- :o:  eclipse-cdt/stable  -- Eclipse für C++ Programmierung
- :o:  eclipse-jdt/stable  -- Eclipse für Java Programmierung
- :o:  eclipse-eclox/stable  -- Doxygen-Plugin für Eclipse
- :o:  eclipse-egit/stable  -- Git-Plugin für Eclipse
- :o:  qtcreator/stable  -- IDE für C++ incl. QT-Framework
- :x:  scratch/stable  -- spielerisch programmieren lernen
- :x:  squeak-plugins-scratch/stable  -- spielerisch programmieren lernen (Erweiterung)
- :o:  netbeans/stable  -- IDE für Webprogrammierung (Ist leider nicht im Repo)
- :x:  swi-prolog/stable  -- deklaratives Programmieren
- :+1:  swi-prolog-doc/stable  -- 
- :+1:  swi-prolog-java/stable  -- 
- :+1:  swi-prolog-odbc/stable  -- 
- :x:  arduino/stable  -- Entwicklungswerkzeuge für den Anschluss von Arduino-Boards für Hobbybastler und andere

##  Datenbanken

- :x:  sqlite3/stable  -- kleine leichtgewichtige SQL-Datenbank mit Konsolen-Frontend
- :x:  sqlitebrowser/stable  -- grafisches Datenbankfrontend für Sqlite
- :o:  mysql-server/stable  -- MySQL-Datenbankserver
- :o:  mysql-client/stable  -- MySQL-Datenbankclient (Konsolenvariante)
- :o:  phpmyadmin/stable  -- umfangreiches und lehrreiches MySQL-Webfrontend

##  Terminal Tools

- :x:  mc/stable  --		Midnight Commander - ein guter Dateimanager
- :x:  vim/stable  --		verbesserter vi-Editor
- :x:  vimhelp-de/stable  --	Dokumentationsdateien deutsche Übersetzung
- :+1:  vim-scripts/stable  --	Erweiterungen für vim
- :x:  screen/stable  --	Terminalmultiplexer mit VT100/ANSI-Terminalemulation
- :x:  silversearcher-ag/stable  -- sehr schnell grep-ähnliches Programm
- :x:  htop/stable  -- interaktive Prozessübersicht für die Konsole
- :x:  pandoc/stable  -- Multiformatkonverter
- :x:  pandoc-citeproc/stable  -- Literaturverwaltungserweiterung für Pandoc
- :x:  docutils-common/stable  -- weiterer Multiformatkonverter (für Restructured Text)
- :x:  hopenpgp-tools/stable  -- hOpenPGP-basierte Kommandozeilentools für digitale Signaturen (etwa für PDF-Dateien)

- ###  grafik

- :x:  dvipng/stable  --	Konvertiert DVI-Dateien in PNG-Grafiken
- :x:  imagemagick/stable  --	konsolenbasierte Bildbearbeitungsprogramme - gut in Skripten zu verwenden z.B.: um ganze Bilderordner zu konvertieren
- :x:  graphviz/stable  --	umfangreiches Graphenerstellungstool, das häufig in Skripten verwendet wird

- ###  utils

- :x:  console-setup/stable  -- Programm zur Einstellung von Schriftart und Tastaturbelegung für die Konsole 
- :x:  usbutils/stable  --	Linux USB-Hilfsprogramme 
- :x:  pciutils/stable  --	PCI-Hilfsprogramme
- :x:  lshw/stable  --		Informationen über die Hardwarekonfiguration
- :x:  lsdvd/stable  --	liest die Inhaltsinformation einer DVD
- :x:  eject/stable  --	Auswerfen von CDs und Steuern von CD-Wechslern unter Linux
- :x:  udisks/stable  --	zum ein/aushängen von Speichermedien 
- :x:  sshfs/stable  --	Dateisystemclient, der auf dem SSH-Dateiübertragungsprotokoll basiert
- :x:  pm-utils/stable  --	Powermanagement
- :x:  testdisk/stable  --	Datenrettungswerkzeug
- :x:  dosfstools/stable  --	Programme zum Anlegen und Überprüfen von MS-DOS-FAT-Dateisystemen

- :x:  cups/stable  --		Common UNIX Printing System(tm) - PPD-/Treiber-Unterstützung, Webschnittstelle
- :x:  cups-bsd/stable  --	Common UNIX Printing System(tm) - BSD-Befehle 

[//]: # (Carsten: printer-driver-cups-pdf will während des Bauens ein root-Passwort eingegeben haben)
- :-1:  printer-driver-cups-pdf/stable  -- Drucker Treiber zur PDF-Erzeugung 

- ###  text 

- :x:  most/stable  --		Pager-Programm - alternativ zu more / less

- ###  admin

- :x:  dselect/stable  --	Oberfläche für die Debian-Paketverwaltung 
- :x:  fbset/stable  --	Framebuffer-Geräte einstellen
- :x:  hdparm/stable  --	Festplattenparameter einstellen 
- :x:  localepurge/stable  --	Freigeben von Festplattenplatz durch Entfernen nicht benötigter Lokalisierungen 
- :x:  cryptsetup/stable  --	Unterstützung für Festplattenverschlüsselung - Startskripte
- :x:  gdisk/stable  --	Textmodus-Partitionierungswerkzeug GPT fdisk

- ###  kernel

- :x:  squashfs-tools/stable  -- Werkzeug zum Erzeugen und Hinzufügen von squashfs-Dateisystemen

##  German User  -- System Tools - Deutsche Sprachpakete

- ###  task-german

- :x:  manpages-de/stable  --
- :x:  wngerman/stable  --
- :x:  ingerman/stable  --
- :x:  aspell-de/stable  --
- :x:  aspell-de-alt/stable  --
- :+1:  hunspell/stable  -- weitere Rechtschreibkorrektur

- :x:  util-linux-locales/stable  --
- :x:  gettext/stable  --		GNU-Internationalisierungswerkzeuge

## fonts

- :x:  ttf-bitstream-vera/stable  --	Die TrueType-Schriftfamilie Bitstream Vera
- :x:  fonts-dejavu/stable  --		Vera-Schriftartfamile mit zusätzlichen Zeichen 
- :x:  fonts-texgyre/stable  --	OpenType-Schriften auf Basis der URW-Schriften
- :x:  fonts-liberation/stable  --	Schriften mit den gleichen Metriken wie Times, Arial und Courier
- :x:  fonts-lmodern/stable  --	OpenType-Schriften auf Grundlage von Computer Modern
- :x:  fonts-freefont-ttf/stable  --	Freefont-TrueType-Schriften Serif, Sans und Mono 
- :x:  fonts-freefont-otf/stable  --	Freefont Serif, Sans and Mono OpenType fonts

##  SystemTools - Virtualisierung - Netzwerk

- :o:  gpart/stable  -- Partitionierungsprogramm (Konsolenvariante)
- :o:  gparted/stable  -- Partitionierungsprogramm (Frontend)
- :+1:  discover/stable  -- grafische, einfach gehaltene, Softwareverwaltung
- :x:  installation-report/stable  -- Hilfstool für Bugreports
- :x:  reportbug/stable  -- Hilfstool für Bugreports
- :x:  python-vte/stable  -- Gui-Bibliothek für reportbugs

- ###  Virtualisierung

- :x:  qemu-kvm/stable  --	Vollständige Virtualisierung auf x86-Hardware 
- :+1:  virt-manager/stable  -- mächtiges Virtualisierungsprogramm
- :x:  virtualbox/stable  -- einfach zu bedienendes Virtualisierungsprogramm
- :x:  virtualbox-guest-utils/stable  -- 
- :x:  virtualbox-guest-x11/stable  -- 

- ###  Netzwerk

- :x:  wireshark/stable  -- Netzwerkanalysetool
- :x:  traceroute/stable  -- Netzwerkanalysetool
- :x:  network-manager-openvpn/stable  --	Verwaltung von Netzwerken OpenVPN-Erweiterung
- :x:  network-manager-pptp/stable  --		Verwaltung von Netzwerken PPTP-Erweiterung (Point-to-Point Tunneling Protocol)
- :x:  network-manager-vpnc/stable  --		Verwaltung von Netzwerken VPNC-Erweiterung (Cisco-kompatibler VPN-Client)
- :x:  modem-manager-gui/stable  --		GUI front-end for ModemManager / Wader / oFono

- ###  Wlan - Hardware

- :x:  crda/stable  --		Central Regulatory Domain Agent für kabellose Geräte 
 - :x:  iw/stable  --		Werkzeug für die Konfiguration von drahtlosen Linux-Geräten (WiFi /WLAN)
- :x:  rfkill/stable  --	Wlan, Bluetooth & Co. an-/ abschalten
- :x:  wireless-tools/stable  --	zum Bearbeiten von WLAN Einstellungen 

- [ ]  firmware-b43-installer/stable  -- installiert die Broadcom 43xx WLAN Karten Firmware
[//]: # (Carsten: Ist das nur der Installer, oder der komplette Treiber?)
[//]: # (Gerd: installiert den Firmwareteil der Treiber)

- :x:  firmware-linux-free/stable  --
- :o:  firmware-b43-installer/stable  --
- :o:  firmware-iwlwifi/stable  -- wird von Thinkpads (getestet mit einem T420) gebraucht

##  live  -- System Pakete werden fürs Live-System benöttigt

- :x:  live-boot/stable  --
 - :x:  live-tools/stable  --
 - :x:  rsync/stable  --
 - :x:  uuid-runtime/stable  -- 
- :x:  live-config/stable  --
 - :x:  live-config-systemd/stable  --
 - :x:  iproute2/stable  --
 - :x:  user-setup/stable  --

