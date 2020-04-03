# Der Freie-Software-Freies-Wissen-Schul- und Uni-Stick

## neu: der [FSFW Schulstick](variants/FSFW-Schulstick/README.md)  2020 ist **so gut wie** fertig

[…]

Das Projekt "FSFW-Uni-Stick" besteht aus zwei Komponenten (jeweils angepasst auf die Zielgruppe Studierende bzw. den Anwendungsfall Studium):

* ein Debian-Live-Linux-System mit [vielen Anwendungen](variants/FSFW-Uni-Stick-Xfce/packages.md)
* Zusammenstellung von [Programmen für Windows](doc/src/windows.md)

Dieses Repo enthält die Skripte und Konfigurationsdateien, die zur Erstellung des angepassten Linux-Live-Systems benötigt werden.
Momentan (Mai 2019) wird noch das Tool  *live-build* benutzt. Mittelfristig ist geplant, das Basis-Image mit `vmdb2` (Nachfolger von `vmdebootstrap`) zu bauen und weitergehende Anpassungen z.B. mittels Ansible-Skripten vorzunehmen. Dabei ist eine Kooperation mit dem [https://github.com/imedias/lernstickAdvanced](Lernstick-Projekt) angestrebt.

**Screenshot vom Desktop (2018-08-18):**
![Screenshot](doc/screenshot-KDE-Desktop-2018-08-18.png "Screenshot")

# Weitere Infos:
Aktuelle Informationen (u.a. zur Verteilung vor Ort in Dresden) unter: [https://fsfw-dresden.de/uni-stick](https://fsfw-dresden.de/uni-stick).

## Benutzer.innen Doku:
* [doc/src/index.md](doc/src/index.md): Welche Programme sind dabei und wozu sind die gut?
* [scripts/README.md](scripts/README.md): Erstellen eines bootfähigen USB-Sticks mit dem Live-Image

## Entwickler.innen Doku:
* [CONTRIBUTING.md](CONTRIBUTING.md)
* [doc/Developing-README.md](doc/Developing-README.md)
* [doc/Developing-CHECKLIST.md](doc/Developing-CHECKLIST.md)
* [doc/Developing-TODO.md](doc/Developing-TODO.md)
