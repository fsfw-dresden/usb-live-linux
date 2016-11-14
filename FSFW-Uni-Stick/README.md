# FSFW-Uni-Stick erstellen

### getestet auf Debian "jessie" (stable) und Debian "stretch" (testing) - 2016-10-28

live-build muss installiert sein, um das ggf. nachzuholen 

    $ sudo apt-get update && sudo apt-get install live-build

Pakete die ebenfalls wichtig sind und installiert sein sollten: 

 - sudo, wget, rsync, pandoc, python3, perl

Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

In das Arbeitsverzeichnis wechseln

  ` $ cd usb-live-linux/FSFW-Uni-Stick/ `

FSFW-Uni-Stick CD-Image bauen

  ` $ ./fsfw-uni-stick_build.sh `

### --- fsfw-uni-stick_build.sh --- 
an Stelle von "fsfw-uni-stick_build.sh" können auch nachfolgende Schritte ausgeführt werden.

Paketlisten generieren - extra Pakete holen

  ` $ auto/paketliste `

  ` $ ../tools/extra-install_paket.sh	`

FSFW Material/Doku bauen, user config anpassen (optional)

  ` $ ../tools/fsfw-user_config.sh `

Live-Image erstellen (das kann eine Weile dauern…)

  ` $ sudo lb build `

### -----

Das " live-image " wurde erfolgreich erstellt ?

  ` $ ls -l *.iso `


### testen des Images " FSFW-Uni-Stick_jessie-amd64.hybrid.iso " in einer virtuell Umgebung mittels kvm (qemu)

Benutzerberechtigung ändern 

  ` $ sudo chown ${USER}:${USER} FSFW-Uni-Stick_*_jessie-amd64.hybrid.iso ` 

Image mittels kvm (Kernel-based Virtual Machine) testen

  ` $ kvm -m 1024 -cdrom FSFW-Uni-Stick_jessie-amd64.hybrid.iso `

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat


### Areitsverzeichnis aufräumen 

Arbeitsdaten löschen 

Soll die erstellte **FSFW-Uni-Stick_jessie-amd64.hybrid.iso** erhalten bleiben, ist sie umzubennenen.

zum Beispiel:

  ` $ mv FSFW-Uni-Stick_jessie-amd64.hybrid.iso FSFW-Uni-Stick_DESKTOP_jessie-amd64.hybrid.iso `

Arbeitsdaten wie chroot, binary bootstrap etc. werden gelöscht 

heruntergeladene Pakete bleiben im "cache/packages.*/*.deb" erhalten 

  ` $ sudo lb clean `

Arbeitsverzeichnis komplett aufräumen

  ` $ sudo lb clean --purge `

