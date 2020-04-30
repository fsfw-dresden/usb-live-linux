# Paketliste für FSFW-Schulstick

##  Desktop  --

- ### :o:  desktop-base  -- [Allgemeine Dateien für den Debian-Desktop](../shared/package-lists/desktop-base.md)

- ### :o:  desktop-tools  -- [Admin Programme für die Grafische Verwaltung](../shared/package-lists/desktop-tools.md)

- ### :o:  task-kde-desktop  -- [KDE Desktop Umgebung](../shared/package-lists/task-kde-desktop.md)

[//]: # ( gerd: schlägt mate als Desktop vor - benötigt weniger Ressourcen )
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption >> kvm -m 1024 << benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption >> kvm -m 256 <<, für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )
- ### :o:  task-mate-desktop  -- [Mate Desktop Umgebung](../shared/package-lists/task-mate-desktop.md)

- ### :o:  task-gnome-desktop  --

- ### :o:  task-xfce-desktop  -- [XFCE Desktop - Windows 95 done right](../shared/package-lists/task-xfce-desktop.md)

- ### :o:  task-cinnamon-desktop  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :o:  accessibility  -- [Software zur Barrierereduzierung](../shared/package-lists/accessibility.md) - Accessibility-Paketliste


##  Desktop office  -- Büroprogrammsammlung - E-Mail - Browser - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :o:  libreoffice  -- [Libre Office](../shared/package-lists/libreoffice.md) - Büroprogrammsammlung - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :o:  kommunikation  -- [Programme für die Kommunikation](../shared/package-lists/kommunikation.md) - Webbrowser - E-Mail - Groupware - Messaging

- ### :o:  desktop-text  -- [Desktop Programme](../shared/package-lists/desktop-text.md) - PDF-Tools - Textverarbeitung - Wiki-Tools

- ### :o:  desktop-video-audio  -- [Programme für Video- und Audioverarbeitung](../shared/package-lists/desktop-video-audio.md) - Video - Film - Audio - Konverter etc.

- ### :o:  desktop-grafik  -- [Programme für Grafik und Bildverarbeitung](../shared/package-lists/desktop-grafik.md) - Bildbearbeitung - Fotoverwaltung - DTP - Vetktor Zeichenprogramm

- ### :o:  desktop-maker  --  [Maker Tools](../shared/package-lists/desktop-maker.md) -  3D Modellierung - Rendering - CAD - 3D Tools - G-Code - LaserCut


##  Education - Science  --  Bildung und Wissenschaft

- ### :o:  texlive  -- [LaTex Toolbox](../shared/package-lists/texlive.md)  - Dokumenten Satzprogramm

- ### :o:  science  -- [Wissenschaft](../shared/package-lists/science.md) - Literaturverwaltung - social-science

- ### :o:  mathematics  --  [Mathematiksoftware für die Lehre](../shared/package-lists/mathematics.md) -

- ### :o:  python-scientific  --  [Python](../shared/package-lists/python-scientific.md) - für wissenschaftliches Arbeiten

- ### :o:  statistik  --  [Statistik Programme](../shared/package-lists/statistik.md) - für statistische Berechnungen und Grafiken

- ### :o:  education  -- [Programme fürs Lernen](../shared/package-lists/education.md) - Sprache - languages - chemistry - geography - astronomy

- ### :o:  electronics  -- [Elektronik](../shared/package-lists/electronics.md) - Schaltplanentwurf - Schaltungssimulation - Funksignalverarbeitung - Logic analyzer und protocol decoder software


##  Programmierung Softwareentwicklung  --

- ### :o:  programmiersprache  -- [Programmiersprachen](../shared/package-lists/programmiersprache.md) - PHP - Java

- ### :o:  programmieren-tools  -- [Tools fürs Programmieren](../shared/package-lists/programmieren-tools.md) - Compiler - Tools - Revisions-Kontroll-Systeme - UML-Tools

- ### :o:  programmieren-ide  --  [Programmier IDEs](../shared/package-lists/programmieren-ide.md) - Editoren - Programmierumgebungen - Java - arduino - scratch


##  Terminal Tools  --

- ### :o:  terminal-tools  -- [Terminal Tools](../shared/package-lists/terminal-tools.md) - Programme die keine Grafische Oberfläche benötigen

- ### :o:  system-tools  -- [System Tools](../shared/package-lists/system-tools.md)

- ### :o:  german-user  -- [German User](../shared/package-lists/german-user.md)  -- System Tools - Deutsche Sprachpakete
- ### :o:  hindi-user  -- [Hindi User](../shared/package-lists/hindi-user.md)  -- System Tools - Indische Sprachpakete


##  System-Tools - Virtualisierung - Netzwerk

- ### :o:  datenbanken  -- [Datenbanken](../shared/package-lists/datenbanken.md) -

- ### :o:  virtualisierung  -- [Virtualisierung](../shared/package-lists/virtualisierung.md) -

- ### :o:  netzwerk-tools  -- [Netzwerk Tools](../shared/package-lists/netzwerk-tools.md) - Netzwerkanalyse - Verwaltung - Werkzeuge - Wlan -


##  System Tools  --

- ### :x:  live  -- [LIVE-System](../shared/package-lists/live.md) - System Pakete werden fürs Live-System benöttigt

- ### :x:  recommends  -- [Recommends](../shared/package-lists/recommends.md) - Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- ### :o:  firmware  -- [Firmware](../shared/package-lists/firmware.md)


##  Spiele - Unterhaltsames

- ### :o:  games  -- [Games -- Entertainment for the young](../shared/package-lists/games.md)

##  Staging  --

- ### :o:  electro-science  -- [](../shared/package-lists/electro-science.md)
- ### :o:  dictionaries  -- [](../shared/package-lists/dictionaries.md)
- ### :o:  fonts  -- [](../shared/package-lists/fonts.md)
- ### :o:  gui-apps  -- [](../shared/package-lists/gui-apps.md)
- ### :o:  system  -- [](../shared/package-lists/system.md)
- ### :o:  terminal-environment  -- [](../shared/package-lists/terminal-environment.md)
- :o:  riot-web  --		feature-rich client for Matrix.org
- :o:  zulip  --		productive team chat (+47,4 MB)
- :x:  wget  --		
- :x:  util-linux  --		
- :x:  fdisk  --		
- :x:  f2fs-tools  --		
- :x:  findutils  --		
- :x:  coreutils  --		
- :x:  bzip2  --		
- :x:  whois  --		
- :x:  os-prober  --		
- :x:  ranger  --		
- :x:  network-manager  --		

