# Paketliste für FSFW UNI Stick (USB-Live-Stick)

##  Desktop  --

- ### :x:  desktop-base  -- [Allgemeine Dateien für den Debian-Desktop](desktop-base.md)

- ### :x:  desktop-tools  -- [Admin Programme für die Grafische Verwaltung](desktop-tools.md)

- ### :x:  task-kde-desktop  -- [KDE Desktop Umgebung](task-kde-desktop.md)

[//]: # ( gerd: schlägt mate als Desktop vor - benötigt weniger Ressourcen )
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption >> kvm -m 1024 << benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption >> kvm -m 256 <<, für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )
- ### :o:  task-mate-desktop  -- [Mate Desktop Umgebung](task-mate-desktop.md)

- ### :o:  task-gnome-desktop  --

- ### :o:  task-xfce-desktop  -- [XFCE Desktop - Windows 95 done right](task-xfce-desktop.md)

- ### :o:  task-cinnamon-desktop  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :x:  accessibility  -- [Software zur Barrierereduzierung](accessibility.md) - Accessibility-Paketliste


##  Desktop office  -- Büroprogrammsammlung - E-Mail - Browser - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  libreoffice  -- [Libre Office](libreoffice.md) - Büroprogrammsammlung - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  kommunikation  -- [Programme für die Kommunikation](kommunikation.md) - Webbrowser - E-Mail - Groupware - Messaging

- ### :x:  desktop-text  -- [Desktop Programme](desktop-text.md) - PDF-Tools - Textverarbeitung - Wiki-Tools

- ### :x:  desktop-video-audio  -- [Programme für Video- und Audioverarbeitung](desktop-video-audio.md) - Video - Film - Audio - Konverter etc.

- ### :x:  desktop-grafik  -- [Programme für Grafik und Bildverarbeitung](desktop-grafik.md) - Bildbearbeitung - Fotoverwaltung - DTP - Vetktor Zeichenprogramm

- ### :x:  desktop-maker  --  [Maker Tools](desktop-maker.md) -  3D Modellierung - Rendering - CAD - 3D Tools - G-Code - LaserCut


##  Education - Science  --  Bildung und Wissenschaft

- ### :x:  texlive  -- [LaTex Toolbox](texlive.md)  - Dokumenten Satzprogramm

- ### :x:  science  -- [Wissenschaft](science.md) - Literaturverwaltung - social-science

- ### :x:  mathematics  --  [Mathematiksoftware für die Lehre](mathematics.md) -

- ### :x:  python-scientific  --  [Python](python-scientific.md) - für wissenschaftliches Arbeiten

- ### :x:  statistik  --  [Statistik Programme](statistik.md) - für statistische Berechnungen und Grafiken

- ### :x:  education  -- [Programme fürs Lernen](education.md) - Sprache - languages - chemistry - geography - astronomy

- ### :x:  electronics  -- [Elektronik](electronics.md) - Schaltplanentwurf - Schaltungssimulation - Funksignalverarbeitung - Logic analyzer und protocol decoder software


##  Programmierung Softwareentwicklung  --

- ### :x:  programmiersprache  -- [Programmiersprachen](progammiersprache.md) - PHP - Java

- ### :x:  programmieren-tools  -- [Tools fürs Programmieren](programmieren-tools.md) - Compiler - Tools - Revisions-Kontroll-Systeme - UML-Tools

- ### :x:  programmieren-ide  --  [Programmier IDEs](programmieren-ide.md) - Editoren - Programmierumgebungen - Java - arduino - scratch


##  Terminal Tools  --

- ### :x:  terminal-tools  -- [Terminal Tools](terminal-tools.md) - Programme die keine Grafische Oberfläche benötigen

- ### :x:  system-tools  -- [System Tools](system-tools.md)

- ### :x:  german-user  -- [German User](german-user.md)  -- System Tools - Deutsche Sprachpakete


##  System-Tools - Virtualisierung - Netzwerk

- ### :x:  datenbanken  -- [Datenbanken](datenbanken.md) -

- ### :x:  virtualisierung  -- [Virtualisierung](virtualisierung.md) -

- ### :x:  netzwerk-tools  -- [Netzwerk Tools](netzwerk-tools.md) - Netzwerkanalyse - Verwaltung - Werkzeuge - Wlan -


##  System Tools  --

- ### :x:  live  -- [LIVE-System](live.md) - System Pakete werden fürs Live-System benöttigt

- ### :x:  recommends  -- [Recommends](recommends.md) - Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- ### :x:  firmware  -- [Firmware](firmware.md)


##  Staging 2018  --

- ### :x:  staging-2018  -- [Freestyle Paketliste](staging-2018.md)

