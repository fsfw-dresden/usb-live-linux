Das Verzeichnis **FSF-Uni-Stick** enthält die wesentlichen Dateien, um das Linux-Live-Image des FSFW-Uni-Sticks zu erstellen.

# Kurzanleitung zum Erstellen und Testen des Live-Linux Images für den FSFW-Uni-Stick

(getestet auf Debian "buster"  - 2020-02-14)

## Erstellen

Wichtigste Komponente im Build-Prozess ist das Paket `live-build`, außerdem werden weitere Pakete benötigt:

    $ sudo apt-get update && sudo apt-get install live-build pandoc python3 perl sudo wget rsync


Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

In das Arbeitsverzeichnis wechseln

  ` $ cd usb-live-linux/FSFW-Uni-Stick/ `

FSFW-Uni-Stick CD-Image bauen

  ` $ ./fsfw-uni-stick_build.sh ../variants/FSFW-Uni-Stick__console__buster_amd64 `



### USB-Stick erstellen
siehe [../tools/README.md](../tools/README.md)
