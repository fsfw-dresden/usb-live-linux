# Der Freie-Software-Freies-Wissen-Uni-Stick
Das Projekt "FSFW-Uni-Stick" besteht aus zwei Komponenten (jeweils angepasst auf die Zielgruppe Studierende bzw. den Anwendungsfall Studium):

* ein Debian-Live-Linux-System mit [vielen Anwendungen](config/FSFW-Uni-Stick_KDE_stretch_amd64/doc/FSFW-Uni-Stick_-_Paketliste.md)
* Zusammenstellung von [Programmen für Windows](config/FSFW-Uni-Stick_KDE_stretch_amd64/doc/src/windows.md)

Dieses Repo enthält die Skripte und Konfigurationsdateien, die zur Erstellung des angepassten Linux-Live-Systems benötigt werden.
Momentan (August 2018) wird noch das Tool  *live-build* benutzt. Mittelfristig (2019) ist geplant, das Basis-Image mit `vmdb2` (Nachfolger von `vmdebootstrap`) zu bauen und weitergehende Anpassungen z.B. mittels Ansible-Skripten vorzunehmen. Dabei ist eine Kooperation mit dem [https://github.com/imedias/lernstickAdvanced](Lernstick-Projekt) angestrebt.

**Screenshot vom Desktop (2017-02-07):**
![Screenshot-1](doc/dev_doc/data/desktop-screenshot-1.jpg "Screenshot")


# Weitere Infos:
Aktuelle Informationen (u.a. zur Verteilung vor Ort in Dresden) unter: [https://fsfw-dresden.de/uni-stick](https://fsfw-dresden.de/uni-stick).

## Benutzer.innen Doku:
* [doc/src/index.md](config/FSFW-Uni-Stick_KDE_stretch_amd64/doc/src/index.md): Welche Programme sind dabei und wozu sind die gut?
* [FSFW-Uni-Stick/README.md](FSFW-Uni-Stick/README.md): Wie kann ich lokal bei mir das Live-Image erzeugen und testen?
* [tools/README.md](tools/README.md): Erstellen eines bootfähigen USB-Sticks mit dem Live-Image


## Entwickler.innen Doku:
* [CONTRIBUTING.md](CONTRIBUTING.md)
* [dev_doc](doc/dev_doc/src/README.md)


