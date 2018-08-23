Das Verzeichnis **FSF-Uni-Stick** enthält die wesentlichen Dateien, um das Linux-Live-Image des FSFW-Uni-Sticks zu erstellen.

# Kurzanleitung zum Erstellen und Testen des Live-Linux Images für den FSFW-Uni-Stick

(getestet auf Debian "stretch"  - 2018-08-20)

## Erstellen

Wichtigste Komponente im Build-Prozess ist das Paket `live-build`, außerdem werden weitere Pakete benötigt:

    $ sudo apt-get update && sudo apt-get install live-build pandoc python3 perl sudo wget rsync


Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

In das Arbeitsverzeichnis wechseln

  ` $ cd usb-live-linux/FSFW-Uni-Stick/ `

FSFW-Uni-Stick CD-Image bauen

  ` $ ./fsfw-uni-stick_build.sh `

Dieses Skript führt im Wesentlichen folgende Schritte aus:

* Arbeitsverzeichnis ggf. von Überresten des letzten Build-Prozesses befreien (siehe unten)

    ` $ sudo lb clean `


* Paketlisten generieren - extra Pakete holen

  ` $ auto/paketliste `

  ` $ ../tools/extra-install_paket.sh	`

* FSFW Doku im HTML-Format erzeugen, user config anpassen (optional)

  ` $ ../tools/fsfw-uni-stick_user-config.sh `

* Live-Image erstellen (das kann 20 - 90 min dauern...)

  ` $ sudo lb build `
  
 * Status-, Warn- und Fehlermeldungen werden in `fsfw-build-script.log` gespeichert.
  
* Benutzerberechtigung ändern (bisher gehört die .iso-Datei root)

  ` $ sudo chown ${USER}:${USER} FSFW-Uni-Stick_*_stretch-amd64.hybrid.iso `  und nach ../images verschieben

 
## Live-Image in einer virtuell Maschine testen

* Image mittels kvm (Kernel-based Virtual Machine) bzw. qemu testen

  ` $ kvm -m 2048 -cdrom ../images/FSFW-Uni-Stick_*_stretch-amd64.hybrid.iso `

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat
  
* Alternativ kann z.B. auch VirtualBox zum erzeugen einer Virtuellen Maschine genutzt werden


### Arbeitsverzeichnis aufräumen 


* Images in ../images/* können gelöscht werden  


* Arbeitsdaten wie chroot, binary bootstrap etc. löschen (heruntergeladene Pakete bleiben im "cache/packages.*/*.deb" erhalten)

  ` $ sudo lb clean `

* Alternativ: Arbeitsverzeichnis komplett aufräumen (auch *.deb Dateien löschen):

  ` $ sudo lb clean --purge `

### USB-Stick erstellen
siehe [../tools/README.md](../tools/README.md)