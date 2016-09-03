# FSFW-Uni-Stick erstellen

### getestet auf Debian "jessie" (stabel) und Debian "stretch" (testing) - 2016-09-02


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

Das " live-image " wurde erfolgreich erstellt ?

  ` $ ls -l *.iso `

### testen des Images " live-image-amd64.hybrid.iso " in einer virtuell Umgebung mittels kvm (qemu)

Benutzerberechtigung ändern 

  ` $ sudo chown ${USER}:${USER} live-image-amd64.hybrid.iso ` 

Image mittels kvm (Kernel-based Virtual Machine) testen

  ` $ kvm -m 1024 -cdrom live-image-amd64.hybrid.iso `

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat

