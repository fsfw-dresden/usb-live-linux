# Paketliste für FSFW UNI Stick (USB-Live-Stick)

##  Desktop  --

- ### :x:  desktop-base  -- [Allgemeine Dateien für den Debian-Desktop](../common_package-lists/desktop-base.md)

- ### :x:  desktop-tools  -- [Admin Programme für die Grafische Verwaltung](../common_package-lists/desktop-tools.md)

- ### :o:  task-kde-desktop  -- [KDE Desktop Umgebung](../common_package-lists/task-kde-desktop.md)

[//]: # ( gerd: schlägt mate als Desktop vor - benötigt weniger Ressourcen )
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption >> kvm -m 1024 << benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption >> kvm -m 256 <<, für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )
- ### :o:  task-mate-desktop  -- [Mate Desktop Umgebung](../common_package-lists/task-mate-desktop.md)

- ### :o:  task-gnome-desktop  --

- ### :x:  task-xfce-desktop  -- [XFCE Desktop - Windows 95 done right](../common_package-lists/task-xfce-desktop.md)

- ### :o:  task-cinnamon-desktop  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :x:  accessibility  -- [Software zur Barrierereduzierung](../common_package-lists/accessibility.md) - Accessibility-Paketliste


##  Desktop office  -- Büroprogrammsammlung - E-Mail - Browser - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  libreoffice  -- [Libre Office](../common_package-lists/libreoffice.md) - Büroprogrammsammlung - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  kommunikation  -- [Programme für die Kommunikation](../common_package-lists/kommunikation.md) - Webbrowser - E-Mail - Groupware - Messaging

- ### :x:  desktop-text  -- [Desktop Programme](../common_package-lists/desktop-text.md) - PDF-Tools - Textverarbeitung - Wiki-Tools

- ### :x:  desktop-video-audio  -- [Programme für Video- und Audioverarbeitung](../common_package-lists/desktop-video-audio.md) - Video - Film - Audio - Konverter etc.

- ### :x:  desktop-grafik  -- [Programme für Grafik und Bildverarbeitung](../common_package-lists/desktop-grafik.md) - Bildbearbeitung - Fotoverwaltung - DTP - Vetktor Zeichenprogramm

- ### :x:  desktop-maker  --  [Maker Tools](../common_package-lists/desktop-maker.md) -  3D Modellierung - Rendering - CAD - 3D Tools - G-Code - LaserCut


##  Education - Science  --  Bildung und Wissenschaft

- ### :x:  texlive  -- [LaTex Toolbox](../common_package-lists/texlive.md)  - Dokumenten Satzprogramm

- ### :x:  science  -- [Wissenschaft](../common_package-lists/science.md) - Literaturverwaltung - social-science

- ### :x:  mathematics  --  [Mathematiksoftware für die Lehre](../common_package-lists/mathematics.md) -

- ### :x:  python-scientific  --  [Python](../common_package-lists/python-scientific.md) - für wissenschaftliches Arbeiten

- ### :x:  statistik  --  [Statistik Programme](../common_package-lists/statistik.md) - für statistische Berechnungen und Grafiken

- ### :x:  education  -- [Programme fürs Lernen](../common_package-lists/education.md) - Sprache - languages - chemistry - geography - astronomy

- ### :x:  electronics  -- [Elektronik](../common_package-lists/electronics.md) - Schaltplanentwurf - Schaltungssimulation - Funksignalverarbeitung - Logic analyzer und protocol decoder software


##  Programmierung Softwareentwicklung  --

- ### :x:  programmiersprache  -- [Programmiersprachen](../common_package-lists/programmiersprache.md) - PHP - Java

- ### :x:  programmieren-tools  -- [Tools fürs Programmieren](../common_package-lists/programmieren-tools.md) - Compiler - Tools - Revisions-Kontroll-Systeme - UML-Tools

- ### :x:  programmieren-ide  --  [Programmier IDEs](../common_package-lists/programmieren-ide.md) - Editoren - Programmierumgebungen - Java - arduino - scratch


##  Terminal Tools  --

- ### :x:  terminal-tools  -- [Terminal Tools](../common_package-lists/terminal-tools.md) - Programme die keine Grafische Oberfläche benötigen

- ### :x:  system-tools  -- [System Tools](../common_package-lists/system-tools.md)

- ### :x:  german-user  -- [German User](../common_package-lists/german-user.md)  -- System Tools - Deutsche Sprachpakete


##  System-Tools - Virtualisierung - Netzwerk

- ### :x:  datenbanken  -- [Datenbanken](../common_package-lists/datenbanken.md) -

- ### :x:  virtualisierung  -- [Virtualisierung](../common_package-lists/virtualisierung.md) -

- ### :x:  netzwerk-tools  -- [Netzwerk Tools](../common_package-lists/netzwerk-tools.md) - Netzwerkanalyse - Verwaltung - Werkzeuge - Wlan -


##  System Tools  --

- ### :x:  live  -- [LIVE-System](../common_package-lists/live.md) - System Pakete werden fürs Live-System benöttigt

- ### :x:  recommends  -- [Recommends](../common_package-lists/recommends.md) - Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- ### :x:  firmware  -- [Firmware](../common_package-lists/firmware.md)


##  Staging  --

- ### :o:  electro-science  -- [](../common_package-lists/electro-science.md)
- ### :o:  dictionaries  -- [](../common_package-lists/dictionaries.md)
- ### :x:  fonts  -- [](../common_package-lists/fonts.md)
- ### :x:  gui-apps  -- [](../common_package-lists/gui-apps.md)
- ### :x:  system  -- [](../common_package-lists/system.md)
- ### :x:  terminal-environment  -- [](../common_package-lists/terminal-environment.md)

