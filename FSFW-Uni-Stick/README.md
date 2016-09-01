
* FSFW-Uni-Stick erstellen

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

