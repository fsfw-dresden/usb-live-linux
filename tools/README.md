Dieses Verzeichnis enthält Hilfs-Skripte, die zum Erstellen des Live-Images oder des Stick-Images benötigt werden.

# Konzept:
Im Rahmen des Projektes *FSFW-Uni-Stick* gibt es zwei verschiedene relevante Image-Typen
* Linux-Live-Image; Ergebnis von `lb build`
* Stick-Image;
  * Es enthält
    * Boot-Konfiguration
    * und bis zu drei Partitioinen:
        * für Linux-Live,
        * für Windows-Programme und
        * für Daten (Persistenz)
  * Es kann in eine Datei oder direkt auf einen USB-Stick geschrieben werden.

# Stick-Image erstellen

(getestet auf Debian Jessie)

Das Skript **FSFW_-_USB-Stick_erstellen.sh** eignet sich, um die im live-build erstellte **FSFW-Uni-Stick_jessie-amd64.hybrid.iso**
auf ein Speichermedium z.B USB-Stick oder in ein Image zu bringen.

  * auf dem Speichermedium können mehrere Partitionen angelegt werden
	* Partition Live-System (ext2) - wird immer benötigt - enthält das Live-System.iso
		* Zusätzlich können Tools wie memtest86+, Hardware Test (HDT) und super-grub2-disk ausgewählt werden
	* Partition Windows-Daten (fat32) um Daten mit Windows zu tauschen
	* Partition Persistence-Daten - Geänderte Daten werden auf die Partition dlp-daten geschrieben und bleiben erhalten

	
Das Skript im live-build-Verzeichnis ausführen 
( /dev/sd.. = zu benutzendes Gerät (z.B. USB-Stick) )

  ` sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdc `

Standardmäßig wird das im live-build-Verzeichnis erstellte \*.iso Image auf das Speicherziel geschrieben.
Alternativ kann auch eine *.iso Datei explizit angegeben werden:

  ` sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdc live-image-alternativ.iso `

**TODO:** Das Skript hat noch mehr Funktionen (noch zu dokumentieren). Die sind aber größtenteils selbsterklärend. Bei Bedarf einfach [fragen](mailto:kontakt@fsfw-dresden.de).

### testen des Speichermediums in einer virtuellen Maschine mittels kvm (qemu)

Image mittels kvm (Kernel-based Virtual Machine) testen

  ` $ sudo kvm -m 1024 -hda /dev/sd..`

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) - kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher der Host-Rechner hat.

