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

* __FSFW-Uni-Stick__	-- hier wird der Stick erstellt - ( ausführen von ./fsfw-uni-stick_build.sh )
* __config__
   - __FSFW-Uni-Stick_KDE_stretch_amd64__ -- config zum erstellen einer Variante
      - __doc__ -- Paketlisten und spezielle Doku und Hinweise für diese Konfigurationsvariante
        - __src__ --	hier sind die *.md - Vorlagen für die Erstellung der *.html Doku ( *.md Dateien werden auf github direkt angezeigt)
      - __system_config__ -- system bedingte vorgaben
      - __user_config__ -- user bezogene vorgaben - Vorlagen für Anpassungen die beim erstellen des Sticks nach /home/user/... gelangen 
* __doc__
   - __build-scripte__ --	scripte erstellen die Doku in *.html --> ./html
   - __dev_doc__	--	Verzeichnis enthält technische Dokumentation mit der Zielgruppe Entwickler.innen des Projekts - Beschreibung von Funktionen ... 
   - __html__	--	hier befinden sich die erstellten Dokudateien -- generiert aus config/FSFW-Uni-Stick_KDE_stretch_amd64/doc/src
   - __latex-vorlagen__ --	Vorlagen für Latex  -- Aktualisierung erfolgt mittels Sub-Repo von: <https://github.com/fsfw-dresden/latex-vorlagen>.
   - __user_doc__ --	--> hierher soll die relevante Dokumentation für user mal hin
   - __daten__ --	--> hier sollten templates und allgemeingültige technische Unterlagen liegen
   - __media__ --	Bilder etc. --> sollten mal nach ./daten verschoben werden
* __images__ --	hier befinden sich die fertigen Images nach dem erstellen
* __release-support__ --	Dateien, die im Zusammenhang mit einem offiziellen Release benötigt werden
* __tools__ --	scripte zum erstellen des Sticks

