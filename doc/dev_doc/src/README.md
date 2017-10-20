Dieses Verzeichnis enthält technische Dokumentation mit der Zielgruppe Entwickler.innen des Projekts.

## Wichtige Dateien in diesem Verzeichnis:
* [CHECKLIST](CHECKLIST.md) Liste mit Funktionen, die nach dem Bauen des Live-Images überprüft werden sollten.
  * Diese Liste definiert (auszugsweise) das von uns gewünschte Verhalten
  * Automatisierte Unittests wären deutlich eleganter sind aber technisch zu schwierig
  

## Tipps:
* README.md und andere Markdown-Dateien sollten vor dem Commit einer Vorschau unterzogen werden.
 * Hilfreiches Tool: [grip](https://github.com/joeyespo/grip)
 * Installation: `sudo pip instal grip`
 
 
## Übersicht Verzeichnisse - Inhalt 

* FSFW-Uni-Stick		hier wird der Stick erstellt
* config
   - FSFW-Uni-Stick_KDE_jessie_amd64		config zum erstellen einer Variante
      - doc			Paketlisten und spezielle Doku und Hinweise für diese Konfigurationsvariante
      - system_config		system bedingte vorgaben
      - user_config		user bezogene vorgaben
* doc
   - build-scripte	scripte erstellen die Doku in *.html --> ./html
   - html		hier befinden sich die erstellten Dokudateien
   - dev_doc		Verzeichnis enthält technische Dokumentation mit der Zielgruppe Entwickler.innen des Projekts - Beschreibung von Funktionen ... 
   - latex-vorlagen	Vorlagen für Latex
   - user_doc		--> hierher soll die relevante Dokumentation für user mal hin
   - daten		--> hier sollten templates und allgemeingültige technische Unterlagen liegen
   - media		Bilder etc. --> sollte nach ./daten verschoben werden
   - src		hier sind die *.md - Vorlagen für die Erstellung der *.html Doku ( *.md Dateien werden auf github direkt angezeigt)
   - src_fsfw-user_config	Vorlagen für Anpassungen die beim erstellen des Sticks nach /home/user/... gelangen 
* release-support	Dateien, die im Zusammenhang mit einem offiziellen Release benötigt werden
* images		hier befinden sich die fertigen Images
* tools			scripte zum erstellen des Sticks

