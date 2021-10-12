# Dokumentation mit der Zielgruppe Entwickler.innen

## Übersicht Verzeichnissstruktur

* __artifacts__ -- hier landen die fertigen Boot-Images
* __build__    -- Arbeitsverzeichnis für Build-Prozess
* __doc__    -- Dokumentationsdateien
* __features__    -- Definition der funktionalen Bausteine (Features) des zu bauenden Systems
* __scripts__ -- diverse Skripte zum Erstellen der Stick-Images, siehe [scripts/README.md](../scripts/README.md)
* __variants.build__    -- verschiedene Bau-Varianten des Sticks mit unterschiedlicher Feature-Auswahl

## Images:
Es gibt zwei Image-Typen:

* das ISO- als boot- & brennbare ISO; Ergebnis vom benutzten Tool `live-build`, z.B. **FSFW-Uni-Stick-TU-Dresden_1768x_Xfce_buster-amd64.hybrid.iso**
* ein Image des kompletten Sticks wird dann mit dem Skript **stick-install** erstellt

## Kurzanleitung zum Bauen und Testen eines FSFW-Stick mittels live-build
Sie brauchen bis zu 50 GiByte freien Speicherplatz. Der Bauprozess kann je nach Variante zwischen 20 min und (bei mechanischer Festplatte) bis zu 3 Stunden dauern.

Das Repository auschecken und das Verzeichnis betreten:

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux `

  ` $ cd usb-live-linux/ `

Eine Build-Variante aussuchen und ISO-Image bauen:

  ` $ sudo scripts/build-live-iso `

## Live-Image in einer virtuell Maschine testen

* Image mittels kvm (Kernel-based Virtual Machine) bzw. qemu testen

  ` $ kvm -m 3G -smp 3 -cdrom artifacts/OSEG-Makerstick_1771j_Xfce_buster-amd64.hybrid.iso `

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat

* Alternativ kann z.B. auch VirtualBox zum erzeugen einer Virtuellen Maschine genutzt werden

## (2017-02-07):
* [Developing-CHECKLIST](Developing-CHECKLIST.md) Liste mit Funktionen, die nach dem Bauen des Live-Images überprüft werden sollten.
  * Diese Liste definiert (auszugsweise) das von uns gewünschte Verhalten
  * Automatisierte Unittests wären deutlich eleganter sind aber technisch zu schwierig

* README.md und andere Markdown-Dateien sollten vor dem Commit einer Vorschau unterzogen werden.
 * Hilfreiches Tool: [grip](https://github.com/joeyespo/grip)
 * Installation: `sudo pip install grip`

