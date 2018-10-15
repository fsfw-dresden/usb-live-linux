Dieses Verzeichnis enthält Hilfs-Skripte, die zum Erstellen des Live-Images oder des Stick-Images benötigt werden.

# Images:
Im Rahmen des Projektes *FSFW-Uni-Stick* gibt es zwei verschiedene Images
* das Linux-Live-Image als boot- & brennbare ISO; Ergebnis von `lb build`, z.B. **FSFW-Uni-Stick_jessie-amd64.hybrid.iso**
* das Image des kompletten Sticks wird dann mit dem Skript **FSFW_-_USB-Stick_erstellen.sh** erstellt
    * bis zu drei Partitionen:
        * Live-System (ext4) mit Live-System.iso u ggf. weitere Tools wie memtest86+, Hardware Test (HDT) und super-grub2-disk
        * Windows-Daten (FAT32) mit PortableApps-Sammlung hilfreicher Windows-Software
        * Persistence-Daten
    * Boot-Loader (GRUB), konfiguriert um die live.iso zu finden und zu starten
    * kann in eine Datei oder direkt auf einen USB-Stick (z.B. /dev/sdb) geschrieben werden.

Beispielaufruf mit USB-Stick an /dev/sdc:
  ` sudo scripts/FSFW_-_USB-Stick_erstellen.sh /dev/sdc `

Standardmäßig wird das zuletzt erstellte Image (../images/FSFW-Uni-Stick_*_KDE_stretch-amd64.hybrid.iso) auf das Speicherziel geschrieben.
Alternativ kann auch eine *.iso Datei explizit als zweites Argument angegeben werden:

  ` sudo scripts/FSFW_-_USB-Stick_erstellen.sh /dev/sdc live-image-alternativ.iso `

