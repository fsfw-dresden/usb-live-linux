[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)

# Paketliste für FSFW UNI Stick (USB-Live-Stick) 

>  zum automatisierten erstellen der Paketlisten aus dieser Doku Paketliste --  im live-build-Verzeichnis ausführen
>  ` rechner:~/usb-live-linux/FSFW-Uni-Stick$ . ../tools/functions.sh  `
>  ` rechner:~/usb-live-linux/FSFW-Uni-Stick$ . ../tools/functions.sh & variant_path_set ~/usb-live-linux/variants/FSFW-Uni-Stick__console__buster_amd64  `
>  ` rechner:~/usb-live-linux/FSFW-Uni-Stick$ . ../tools/md2package-list.sh ~/usb-live-linux/variants/FSFW-Uni-Stick__console__buster_amd64/paketlisten/default `
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
> - :+1: :x:  [Paket vorschlag](http://download-path-paket.deb)  -- ist leider nicht in den Repros verfügbar, wird aber alternativ installiert
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

##  terminal accessibility  -- Barrierereduzierung für Anwender mit Handicap

- ### :o:  terminal-accessibility  -- [Software zur Barrierereduzierung](terminal-accessibility.md) - Accessibility-Paketliste 


##  terminal tools  --

- ### :x:  terminal-tools  -- [Terminal Tools](terminal-tools.md) - Programme die keine Grafische Oberfläche benötigen

- ### :x:  german-user  -- [German User](german-user.md) - System Tools - Deutsche Sprachpakete


##  system tools  --

- ### :x:  system-tools  -- [System Tools](system-tools.md)

- ### :x:  server-tools  -- [Server Tools](server-tools.md)

- ### :x:  recommends  -- [Recommends](recommends.md) - Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- ### :x:  firmware  -- [Firmware](firmware.md) -

- ### :x:  live  -- [LIVE-System](live.md) - System Pakete werden fürs Live-System benötigt

