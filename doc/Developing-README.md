### Dokumentation mit der Zielgruppe Entwickler.innen

## Übersicht Verzeichnissstruktur

* __auto__    -- Autokonfiguration für live-build
* __config__    -- Arbeitsverzeichnis von live-build
* __variants__    -- verschiedene Varianten zum auswählen
   - __FSFW-Uni-Stick_KDE_stretch_amd64__ -- aktuelle stabile Debian-Version
      - __doc__ -- spezielle Doku und Hinweise für diese Konfigurationsvariante
      - __paketlisten__ -- Paketlisten (symlink default => Hauptpaketliste)
      - __config__ -- live-build Konfiguration
      - __home_skel__ -- Vorkonfiguration für Benutzer
   - __FSFW-Uni-Stick_KDE_jessie_amd64__ -- oldstable
* __doc__
   - __latex-vorlagen__ -- Vorlagen für Latex (eigenes Repo)
   - __src__ -- markdown-Vorlagen für Erstellung der HTML Doku (.md wird auf github formatiert angezeigt)
   - __html__ -- hier befinden sich die erstellten Dokudateien
* __iso-images__ -- hier landen die fertigen Boot-Images
* __scripts__ -- diverse Skripte zum Erstellen des Sticks siehe [scripts/README.md](../scripts/README.md)

# Kurzanleitung zum Erstellen und Testen des FSFW-Uni-Stick

## Erstellen mittels live-build

Wichtigste Komponente im Build-Prozess ist das Paket `live-build`, außerdem werden weitere Pakete benötigt:

    $ sudo apt-get update && sudo apt-get install live-build pandoc python3 perl sudo wget rsync

Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

  ` $ cd usb-live-linux/ `

FSFW-Uni-Stick CD-Image bauen

  ` $ scripts/build-live-system.sh `

Dieses Skript führt im Wesentlichen folgende Schritte aus:

* Arbeitsverzeichnis ggf. von Überresten des letzten Build-Prozesses befreien (siehe unten)

    ` $ sudo lb clean `

* Paketlisten konvertieren, extra Pakete holen

  ` $ scripts/md2paketliste `

  ` $ scripts/extra-install-paket.sh `

* FSFW Doku im HTML-Format erzeugen

  ` $ scripts/copy-docs.sh `

* user config anpassen (optional)

  ` $ scripts/prepare-home-skel.sh `

* Live-Image erstellen (kann 20 - 90 min dauern...)

  ` $ sudo lb build `

 * Status-, Warn- und Fehlermeldungen werden in `fsfw-build-script.log` gespeichert.

* Benutzerberechtigung ändern (bisher gehört die .iso-Datei root)

  ` $ sudo chown ${USER}:${USER} FSFW-Uni-Stick_*.hybrid.iso `

## Live-Image in einer virtuell Maschine testen

* Image mittels kvm (Kernel-based Virtual Machine) bzw. qemu testen

  ` $ kvm -m 2G -smp 3 -cdrom iso-images/FSFW-Uni-Stick_*.hybrid.iso `

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat

* Alternativ kann z.B. auch VirtualBox zum erzeugen einer Virtuellen Maschine genutzt werden


### live-build Arbeitsverzeichnis (config) aufräumen 

* Arbeitsdaten wie chroot, binary bootstrap etc. löschen (heruntergeladene Pakete bleiben im "cache/packages.*/*.deb" erhalten)

  ` $ sudo lb clean `

* komplett aufräumen (auch *.deb Dateien löschen):

  ` $ sudo lb clean --purge `

## Anmerkungen (2017-02-07):
* [Developing-CHECKLIST](Developing-CHECKLIST.md) Liste mit Funktionen, die nach dem Bauen des Live-Images überprüft werden sollten.
  * Diese Liste definiert (auszugsweise) das von uns gewünschte Verhalten
  * Automatisierte Unittests wären deutlich eleganter sind aber technisch zu schwierig

* README.md und andere Markdown-Dateien sollten vor dem Commit einer Vorschau unterzogen werden.
 * Hilfreiches Tool: [grip](https://github.com/joeyespo/grip)
 * Installation: `sudo pip install grip`

