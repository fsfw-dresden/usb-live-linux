### FIXME: this is madness

[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)

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
> - :+1: :x:  [Paket vorschlag] (http://download-path-paket.deb)  -- ist leider nicht in den Repos verfügbar, wird aber alternativ installiert
>		- Beschreibung / Erklärungen
>		- Extra Installation da nicht im Repo verfügbar
>		- Quelle:
>		- Abhängigkeiten / Besonderheiten
>
> - :o: :-1:  Paket derzeit nicht benutzt weil -- (Pakete die bei der Installation Probleme/Kollisionen mit anderen Programmen verursachen )
>		- Beschreibung / Erklärungen - falls möglich Lösungsvorschläge
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
