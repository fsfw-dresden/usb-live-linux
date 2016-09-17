# FSFW-Uni-Stick erstellen

### getestet auf Debian "Debian jessie" - LANG=de_DE.UTF-8 - 2016-09-15 

Das Skript **FSFW_-_USB-Stick_erstellen.sh** eignet sich um die im Live-build erstellte **live-image-amd64.hybrid.iso**
auf ein Speichermedium z.B USB-Stick oder in ein Image zu bringen.

  * auf dem Speichermediums können mehrere Partitionen angelegt werden
	* Partition Live-System (ext2) - wird immer benötigt - enthält das Live-System.iso
		* Zusätzlich können Tools wie memtest86+, Hardware Test (HDT) und super-grub2-disk ausgewählt werden
	* Partition Windows-Daten (fat32) um Daten mit Windows zu tauschen
	* Partition Persistence-Daten - Geänderte Daten werden auf die Partition dlp-daten geschrieben und bleiben erhalten

	
Das Skript wirde im live-build-Verzeichnis ausführen 
( /dev/sd.. = Gerät/USB-Stick der benutzt werden soll )

  ` sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdb `

Standardmäßig wird **live-image-amd64.hybrid.iso** auf das Speicherziel geschrieben, es kann aber alternativ
auch ein anderes *.iso Image gewählt werden.

  ` sudo ../tools/FSFW_-_USB-Stick_erstellen.sh /dev/sdx live-image-alternativ.iso `


### testen des Speichermediums in einer virtuell Umgebung mittels kvm (qemu)

Image mittels kvm (Kernel-based Virtual Machine) testen

  ` $ sudo kvm -m 1024 -hda /dev/sd..`

  * Option -m (Speicher in MB, der vom Gastsystem benutzt wird) -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat
  * /dev/sd.. = Gerät/USB-Stick der benutzt werden soll 

