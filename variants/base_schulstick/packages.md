[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)


# Paketliste für FSFW Schulstick

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
> #### Anmerkungen / Fragen / Kommentare
> - am besten als Markdown-Kommentare in den Quelltext
> - Syntax:
>  `[//]: # (Name: Das ist ein Markdown-Kommentar und wird nicht mit gerendert.)`
>
> - Siehe auch den Quelltext dieser Datei
> - Zur lokalen Vorschau eignet sich z.B. [https://github.com/joeyespo/grip](https://github.com/joeyespo/grip)
>

##  Desktop  --

- ### :x:  desktop-base  -- [Allgemeine Dateien für den Debian-Desktop](desktop-base.md)

- ### :x:  desktop-tools  -- [Admin Programme für die Grafische Verwaltung](desktop-tools.md)

- ### :o:  task-kde-desktop  -- [KDE Desktop Umgebung](task-kde-desktop.md)

[//]: # ( gerd: schlägt mate als Desktop vor - benötigt weniger Ressourcen )
[//]: # ( beim testen ist mir aufgefallen: )
[//]: # ( - Images mit KDE-Desktop booten erst wenn die Speicheroption >> kvm -m 1024 << benutzt wird)
[//]: # ( - Images mit Mate-Desktop mit der Speicheroption >> kvm -m 256 <<, für Firefox scheint das aber zu wenig Speicher zu sein - dieser startet nicht - Last geht nach oben )
[//]: # ( - mit der Speicheroption -m 512 geht es gerade so )
[//]: # ( Bemerkung: es wird derzeit keine "Swap Partition" benutzt - sollte man darüber nachdenken ? )
- ### :o:  task-mate-desktop  -- [Mate Desktop Umgebung](task-mate-desktop.md)

- ### :o:  task-gnome-desktop  --

- ### :x:  task-xfce-desktop  -- [XFCE Desktop - Windows 95 done right](task-xfce-desktop.md)

- ### :o:  task-cinnamon-desktop  --

##  Accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :o:  accessibility  -- [Software zur Barrierereduzierung](accessibility.md) - Accessibility-Paketliste


##  Desktop office  -- Büroprogrammsammlung - E-Mail - Browser - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  libreoffice  -- [Libre Office](libreoffice.md) - Büroprogrammsammlung - Editor - Tabellenkalkulation - Zeichenprogramm - Präsentation - Datenbank

- ### :x:  kommunikation  -- [Programme für die Kommunikation](kommunikation.md) - Webbrowser - E-Mail - Groupware - Messaging

- ### :x:  desktop-text  -- [Desktop Programme](desktop-text.md) - PDF-Tools - Textverarbeitung - Wiki-Tools

- ### :x:  desktop-video-audio  -- [Programme für Video- und Audioverarbeitung](desktop-video-audio.md) - Video - Film - Audio - Konverter etc.

- ### :x:  desktop-grafik  -- [Programme für Grafik und Bildverarbeitung](desktop-grafik.md) - Bildbearbeitung - Fotoverwaltung - DTP - Vetktor Zeichenprogramm

- ### :o:  desktop-maker  --  [Maker Tools](desktop-maker.md) -  3D Modellierung - Rendering - CAD - 3D Tools - G-Code - LaserCut


##  Education - Science  --  Bildung und Wissenschaft

- ### :o:  texlive  -- [LaTex Toolbox](texlive.md)  - Dokumenten Satzprogramm

- ### :o:  science  -- [Wissenschaft](science.md) - Literaturverwaltung - social-science

- ### :o:  mathematics  --  [Mathematiksoftware für die Lehre](mathematics.md) -

- ### :x:  python-scientific  --  [Python](python-scientific.md) - für wissenschaftliches Arbeiten

- ### :o:  statistik  --  [Statistik Programme](statistik.md) - für statistische Berechnungen und Grafiken

- ### :o:  education  -- [Programme fürs Lernen](education.md) - Sprache - languages - chemistry - geography - astronomy

- ### :o:  electronics  -- [Elektronik](electronics.md) - Schaltplanentwurf - Schaltungssimulation - Funksignalverarbeitung - Logic analyzer und protocol decoder software


##  Programmierung Softwareentwicklung  --

- ### :o:  programmiersprache  -- [Programmiersprachen](progammiersprache.md) - PHP - Java

- ### :o:  programmieren-tools  -- [Tools fürs Programmieren](programmieren-tools.md) - Compiler - Tools - Revisions-Kontroll-Systeme - UML-Tools

- ### :o:  programmieren-ide  --  [Programmier IDEs](programmieren-ide.md) - Editoren - Programmierumgebungen - Java - arduino - scratch


##  Terminal Tools  --

- ### :x:  terminal-tools  -- [Terminal Tools](terminal-tools.md) - Programme die keine Grafische Oberfläche benötigen

- ### :x:  system-tools  -- [System Tools](system-tools.md)

- ### :x:  german-user  -- [German User](german-user.md)  -- System Tools - Deutsche Sprachpakete
- ### :x:  hindi-user  -- [Hindi User](hindi-user.md)  -- System Tools - Indische Sprachpakete


##  System-Tools - Virtualisierung - Netzwerk

- ### :x:  datenbanken  -- [Datenbanken](datenbanken.md) -

- ### :o:  virtualisierung  -- [Virtualisierung](virtualisierung.md) -

- ### :x:  netzwerk-tools  -- [Netzwerk Tools](netzwerk-tools.md) - Netzwerkanalyse - Verwaltung - Werkzeuge - Wlan -


##  System Tools  --

- ### :x:  live  -- [LIVE-System](live.md) - System Pakete werden fürs Live-System benöttigt

- ### :x:  recommends  -- [Recommends](recommends.md) - Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- ### :x:  firmware  -- [Firmware](firmware.md)


##  Spiele - Unterhaltsames

- ### :x:  games  -- [Games -- Entertainment for the young](games.md)

##  Staging  --

- ### :o:  electro-science  -- [](electro-science.md)
- ### :o:  dictionaries  -- [](dictionaries.md)
- ### :x:  fonts  -- [](fonts.md)
- ### :x:  gui-apps  -- [](gui-apps.md)
- ### :x:  system  -- [](system.md)
- ### :x:  terminal-environment  -- [](terminal-environment.md)
- :o:  zulip  --		productive team chat (+47,4 MB)

