# FSFW-Uni-Stick erstellen

### getestet auf Debian "jessie" (stable) und Debian "stretch" (testing) - 2016-09-17


Herunterladen der benötigeten Dateien

  ` $ git clone https://github.com/fsfw-dresden/usb-live-linux.git `

In das Arbeitsverzeichnis wechseln

  ` $ cd usb-live-linux/FSFW-Uni-Stick/ `

Paketlisten generieren

  ` $ auto/paketliste `

Live-Image erstellen

  ` $ sudo lb build `

Das " live-image " wurde erfolgreich erstellt ?

  ` $ ls -l *.iso `


### testen des Images " FSFW-Uni-Stick_jessie-amd64.hybrid.iso " in einer virtuell Umgebung mittels kvm (qemu)

Benutzerberechtigung ändern 

  ` $ sudo chown ${USER}:${USER} FSFW-Uni-Stick_jessie-amd64.hybrid.iso ` 

Image mittels kvm (Kernel-based Virtual Machine) testen

  ` $ kvm -m 1024 -cdrom FSFW-Uni-Stick_jessie-amd64.hybrid.iso `

  * Optionen

	-m <Speicher in MB, der vom Gastsystem benutzt wird> -- kann auch größer gewählt werden, je nachdem wieviel Arbeitsspeicher dein Rechner hat
	-smp cpus=<Anzahl der zu verwendenden CPUs>  -- ist zum Testen von Multicoresystemen bzw. zum testen aufwendigerer Anwendungen praktisch


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

