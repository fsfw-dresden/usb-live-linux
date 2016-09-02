# FSFW-Uni-Stick erstellen

### getestet auf Debian jessie und Debian strech - 2016-09-02


Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

In das Arbeitsverzeichnis wechseln

  ` $ cd usb-live-linux/FSFW-Uni-Stick/ `

Packetlisten generieren

  ` $ auto/paketliste `

Live-Image erstellen

  ` $ sudo lb build `

Areitsverzeichnis aufräumen ( chroot wird gelöscht, cache bleibt erhalten)

  ` $  sudo lb clean `

Arbeitsverzeichnis komlett aufräumen

  ` $  sudo lb clean --purge `

