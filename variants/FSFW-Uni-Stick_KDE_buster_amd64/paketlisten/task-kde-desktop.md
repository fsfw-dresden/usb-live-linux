##  Desktop - KDE  --

- ###  task-kde-desktop  -- KDE Desktop Umgebung

- :o:  task-kde-desktop  --
 - :o:  sddm  --		Moderner Displaymanager für X11
 - :o:  kde-standard  --	KDE Plasma Desktop und Standardsatz an Anwendungen 

- :o:  kde-full  --  Vollständige KDE (5:102) Software Compilation für Anwender
 - :o:  kde-standard  --
  - :o:  kde-plasma-desktop  --	KDE Plasma Desktop und eine minimale Auswahl an Anwendungen
   - :o:  kde-baseapps  -- 	base applications from the official KDE release
   - :o:  plasma-desktop  --	Werkzeuge und Widgets für die Arbeitsfläche
   - :o:  plasma-workspace  --	Plasma Workspace für KF5
 - :o:  kdeadmin  --		Systemverwaltungsprogramme von der offiziellen KDE-Veröffentlichung
 - :o:  kdeedu  --		Lernprogramme aus der offiziellen KDE-Veröffentlichung
 - :o:  kdegames  --		Spiele aus dem offiziellen KDE-Veröffentlichung
 - :o:  kdegraphics  --		Grafikanwendungen aus der offiziellen KDE-Veröffentlichung
 - :o:  kdemultimedia  --	Multimedia-Anwendungen aus der offiziellen KDE-Veröffentlichung
 - :o:  kdenetwork  --		networking applications from the official KDE release
 - :o:  kdepim  --		Programme zur Verwaltung pers. Informationen aus der offiziellen KDE-Veröffentlichung
 - :o:  kdeutils  --		Universalwerkzeuge aus der offiziellen KDE-Veröffentlichung
 - :o:  plasma-workspace-wallpapers  -- Wallpapers for Plasma 5


- ###  kde-baseapps  --

- :x:  kdialog  --	Dialog display utility
- :x:  keditbookmarks  -- Bookmark Editor utility
- :x:  kfind  --	Dateisuchprogramm
- :x:  konqueror  --	Hochentwickelter Dokumentenbetrachter, Webbrowser und Dateimanager
 - :x:  dolphin  --	Dateimanager
 - :x:  konq-plugins  --	Erweiterungen für Konqueror, den KDE-Datei-/Web-/Dokumenten-Browser
- :x:  konsole  --	X-Terminalemulator
- :x:  kwrite  --	Einfacher Texteditor


- ###  kde-standard  --

- :x:  akregator  --	RSS/Atom-Feed-Aggregator 
- :x:  ark  --		Archiv-Werkzeug 
- :x:  dragonplayer  --	Einfacher Videoabspieler 
- :x:  gwenview  --	Bildbetrachter 
- :x:  juk  --		Jukebox und Musikabspieler 
- :x:  kaddressbook  --	Adressbuch- und Kontaktdatenverwaltung 
- :x:  kate  --		Leistungsstarker Texteditor 
- :x:  kcalc  --	Einfacher wissenschaftlicher Taschenrechner
- :x:  kde-plasma-desktop  -- KDE Plasma Desktop und eine minimale Auswahl an Anwendungen - oder ...netbook
 - :o:  user-manager  -- user management tool for the Plasma workspace
- :x:  kde-spectacle  -- Werkzeug für die Erstellung von Bildschirmfotos (ersetzt KSnapshot)
- :x:  khelpcenter  --	Hilfezentrum 
- :x:  kio-extras  --  Extra functionality for kioslaves - wird benötigt für Vorschau Hintergrundbilder

[//]: # (Carsten: bei kmail wäre zu überlegen, ob man es nicht weglässt. icedove (bzw. vorzugsweise thunderbird) ist ohnehin gesetzt. Alles weitere verwirrt nur.)
- :x:  kmail  --	Vollständiger grafischer E-Mail-Client
- :x:  knotes  --	Programm für Haftnotizen (sticky notes) 
- :x:  kopete  --	Instant-Messaging- und Chat-Anwendung 
- :x:  korganizer  --	Kalender und persönliche Terminverwaltung 
- :x:  kwalletmanager  -- Sichere Passwortverwaltung 
- :x:  okular  --	Universal-Dokumentenbetrachter 
- :x:  plasma-dataengines-addons  --  additional data engines for Plasma 
- :o:  plasma-pa  --    Plasma 5 Volume controller
- :x:  kmix  --		Lautstärkeregler und Mischer 
- :x:  plasma-runners-addons  -- additional runners for Plasma 5 and Krunner 
- :x:  plasma-wallpapers-addons  -- additional wallpaper plugins for Plasma 5 
- :x:  plasma-widgets-addons  --    additional widgets for Plasma 5 
- :x:  polkit-kde-agent-1  --	KDE-Dialoge für PolicyKit 
- :x:  sweeper  --	Löschen von Verlauf und temporären Dateien 


- ### kde system  --

- :x:  kwin-x11  -- KDE-Fenstermanager - X11-Version
- :x:  plasma-theme-oxygen  --  kde-style-oxygen-qt5 / qt4 - Oxygen desktop theme is used by Plasma and other KDE Software
- :x:  fonts-oxygen  --
- :x:  kwin-decoration-oxygen  -- KWin decoration for the Oxygen desktop theme


- ###  kde-l10n  -- virtuelles Paket zur Sprachenunterstützung

- :x:  kde-l10n-de  --	Deutsche (de) Lokalisierung für KDE


- ###  kdeadmin  --

- :x:  kde-config-cron  -- Frontend für die Zeitplanung von Programmen
- :x:  ksystemlog  --      Anzeigeprogramm für Systemprotokolle


- ###  kdegraphics  --

- :x:  gwenview  --	Bildbetrachter
- :x:  kamera  --	Unterstützung von Digitalkameras für KDE-Anwendungen
- :x:  kcolorchooser  -- Farbauswahl und Paletteneditor
- :o:  kde-spectacle  --
- :x:  kgamma5  --	Bedienfeld zur Monitorkalibrierung für KDE
- :x:  kolourpaint  --  Einfaches Zeichen- und Bildbearbeitungswerkzeug
- :x:  kruler  --	Bildschirmlineal
- :o:  okular  --

 - :o:  kpart-webkit  -- KPart für WeKit	- sonst keine Anzeige von *.svg im konqueror -- nicht in buster
- :x:  svgpart  --	SvgPart is a small KDE KPart component to display SVG images in Gwenview and in any other KDE application which uses the KPart system


- ###  kdemultimedia  --

- :x:  dragonplayer  --	Einfacher Videoabspieler
- :x:  juk  --		Jukebox und Musikabspieler


- ###  kdenetwork  --

- :x:  kget  -- Downloadmanager
- :x:  krdc  -- Client - Remote Desktop Connection -
- :x:  krfb  -- Dienstprogramm für gemeinsame Desktop-Nutzung 

- :x:  plasma-nm  --    Plasma5-Bibliothek zur Netzwerkverwaltung 


- ###  kdepim  --

- :x:  kontact  --	   Integrierte Anwendung für die Verwaltung persönlicher Informationen
- :x:  konsolekalendar  -- Persönlicher Organizer für die Konsole
- :x:  kleopatra  --	   Zertifikatsverwaltung und einheitliche Krypto-Oberfläche
- :x:  kalarm  --	   Planer für Alarm-Nachrichten, Befehle und E-Mails

- :x:  accountwizard  --   Assistent für die Einrichtung der Konten von KDE-PIM-Anwendungen

- ###  kdeutils  --

- :x:  filelight  --	Speicherbelegungsvisualisierung
- :x:  kcharselect  --	Dienstprogramm für Sonderzeichen
- :x:  kdf  --		disk information utility
- :x:  kgpg  --		Grafische Oberfläche für den GNU Privacy Guard
- :x:  ktimer  --	Zeitschaltuhr


- ###  kde tools für System Einstellungen  --

- :x:  systemsettings  --	Anwendung zur Konfiguration der Arbeitsfläche
- :x:  khotkeys  --		Konfiguriere die Einstellungen für die Eingabeaktionen in Plasma.
- :x:  kmenuedit  --		stellt einen Menüeditor bereit, mit dem Sie das KDE-Plasma- Arbeitsflächen-Menü oder ein beliebiges anderes XDG-Menü bearbeiten können
- :x:  kde-config-cddb  --	Konfiguration von CDDB-Abfragen
- :x:  kde-config-screenlocker  -- KCM Module for kscreenlocker
- :o:  kde-config-sddm  --	KCM module for SDDM
- :x:  kde-config-gtk-style  -- KDE configuration module for GTK+ 2.x and GTK+ 3.x styles selection
- :x:  kde-config-plymouth  --  KCM for Plymouth
- :x:  kde-config-systemd  --	KDE control center module for Systemd
- :x:  kscreen  --		KDE-Unterstützung für Monitorwechsel und Handhabung der Anzeige
- :x:  kdenetwork-filesharing  -- Filesharing Konfigurationsmodul 

- ###  KDE Programme  --

- :x:  skanlite  --	Auf dem KSane-Backend basierendes Scanprogramm für KDE 4 
- :x:  cantor  --	Oberfläche für mathematische Anwendungen
- :x:  kalgebra  --	Algebraischer grafikfähiger Taschenrechner
- :x:  kig  --		Interaktives Geometrie-Werkzeug für KDE
- :x:  kmplot  --	Mathematischer Funktionsplotter für KDE
- :x:  ktouch  --	Programm um 10-Finger-Schreiben mit der Tastatur zu lernen
- :x:  rocs  --		Integrierte Entwicklungsumgebung (IDE) für Graphentheorie
- :x:  step  --		Interaktiver Physiksimulator für KDE
- :x:  timidity  --	Programm zur Klangerzeugung (MIDI-Sequenzer, MOD-Spieler)
- :x:  kgeography  --	Geographie-Lernhilfe unter KDE

- :x:  okular-extra-backends  --  Unterstützung von zusätzlichen Dokumentformaten für Okular 
- :+1:  kteatime  -- Kurzzeitwecker, damit der Tee weder zu kurz och zu lange zieht
- :o:  ktimetracker  -- Zeiterfassungstool zur Unterstützung bei der Zeiteinteilung - nicht in buster

- :x:  kdiff3  -- Vergleicht und führt zwei oder drei Dateien oder Verzeichnisse zusammen 
 - :o:  kdesudo  -- sudo-Oberfläche für KDE - nicht in buster
- :x:  partitionmanager  -- 	KDE-Programm zur Verwaltung von Dateien, Platten und Partitionen

