##  system-tools  -- 

- ###  admin

- :x:  dselect  --	Oberfläche für die Debian-Paketverwaltung
- :x:  fbset  --	Framebuffer-Geräte einstellen
- :x:  hdparm  --	Festplattenparameter einstellen
- :x:  localepurge  --	Freigeben von Festplattenplatz durch Entfernen nicht benötigter Lokalisierungen 
- :x:  cryptsetup-bin  --	Unterstützung für Festplattenverschlüsselung - Startskripte
- :x:  cryptsetup-run  --	Unterstützung für Festplattenverschlüsselung - Startskripte
- :o:  cryptsetup-initramfs  --	Unterstützung für Festplattenverschlüsselung - Startskripte
- :x:  gdisk  --	Textmodus-Partitionierungswerkzeug GPT fdisk
- :o:  gpart  --	Partitionierungsprogramm (Konsolenvariante)
- :x:  discover  --	Hardware-Erkennungs-System
- :x:  upower  --	bietet eine Schnittstelle für die Spezifizierung der Energiequellen im System und die Steuerung der systemweiten Energieverwaltung
- :x:  uswsusp  --	Werkzeuge für die Nutzung des »userspace software suspend« unter Linux
- :o:  pm-utils  --	Powermanagement
- :x:  linux-cpupower  -- CPU power management tools for Linux
- :x:  udisks2  --	D-Bus-Dienst für Zugriff auf und Manipulation von Speichergeräten
- :x:  udisks2-bcache  -- bcache support for udisks2
- :x:  udisks2-lvm2  --	LVM2 support for udisks2
- :x:  udisks2-vdo  --	VDO support for udisks2
- :x:  udisks2-zram  -- zram support for udisks2
- :x:  udiskie  --	automounter for removable media for Python
- :x:  policykit-1  --	Rahmen für die Verwaltung von Privilegien und administrativen Verfahren
- :x:  mdadm  --	Werkzeug zum Verwalten von Multi-Disk-Arrays unter Linux (Software RAID)
- :x:  f2fs-tools  --	Tools for Flash-Friendly File System

- ### sonstige

- :x:  inxi  --		full featured system information script
- :x:  installation-report  --	Hilfstool für Bugreports

- :x:  pcscd  --	Middleware für den Zugriff auf Chipkarten mit PC/SC (Daemon-Software)
- :x:  pcsc-tools  --	Programme für die Arbeit mit Chipkarten und PC/SC

- ###  utils

- :x:  bash-completion  -- Programmierbare Vervollständigung für die Bash-Shell
- :x:  console-setup  -- Programm zur Einstellung von Schriftart und Tastaturbelegung für die Konsole
- :x:  usbutils  --	Linux USB-Hilfsprogramme 
- :x:  pciutils  --	PCI-Hilfsprogramme
- :x:  lshw  --		Informationen über die Hardwarekonfiguration
- :x:  testdisk  --	Datenrettungswerkzeug
- :x:  f3  --		Testet USB-Sticks und andere Flash-Speicher auf Integrität und Größenangaben
- :x:  dosfstools  --	Programme zum Anlegen und Überprüfen von MS-DOS-FAT-Dateisystemen
- :x:  hddtemp  --	Programm zur Überwachung der Festplattentemperatur
- :x:  smartmontools  -- Kontrolle und Überwachung von Speichersystemen mittels S.M.A.R.T.

- :x:  acpi  --		Anzeigen von Informationen zu ACPI-Geräten
- :x:  acpid  --	Daemon für die Behandlung von ACPI-Ereignissen
- :x:  acpitool  --	Kommandozeilen-Client für ACPI
- :x:  yacpi  --	ncurses based acpi monitor for text mode
- :x:  powermgmt-base  -- Gemeinsame Hilfsprogramme/Konfigurationen für den Stromspar-Modus
- :x:  fancontrol  --	Programm zur Steuerung der Lüfter-Drehzahl
- :x:  lm-sensors  --	Programme zum Lesen von Temperatur-/Spannungs-/Lüfter-Sensoren
- :x:  i2c-tools  --	Heterogener I2C-Werkzeugsatz für Linux

- :x:  eject  --	Auswerfen von CDs und Steuern von CD-Wechslern unter Linux
- :x:  lsdvd  --	liest die Inhaltsinformation einer DVD

- :x:  cups  --		Common UNIX Printing System(tm) - PPD-/Treiber-Unterstützung, Webschnittstelle
- :x:  cups-bsd  --	Common UNIX Printing System(tm) - BSD-Befehle 
- :x:  printer-driver-cups-pdf  -- Drucker Treiber zur PDF-Erzeugung

- :x:  sshfs  --	Dateisystemclient, der auf dem SSH-Dateiübertragungsprotokoll basiert
- :x:  gnupg  --	GNU Privacy Guard - ein freier Ersatz für PGP

- :x:  reportbug  --		Werkzeug, um Fehler (Bugs) in Debian und abgeleiteten Distributionen relativ schmerzfrei zu melden

- ###  Bluetooth  -- 

- :x:  bluez  --	Bluetooth-Werkzeuge und -Dienste
- :x:  bluez-tools  --	Set of tools to manage Bluetooth devices for linux

- ###  utils-recommends  -- Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- :x:  bzip2  --	Qualitativ hochwertiger, Blöcke sortierender Dateipacker
- :x:  unzip  --	Entpacker für .zip-Dateien
- :x:  rsync  --	Schnelles, vielseitiges Kopierwerkzeug für entfernte (und lokale) Dateien
- :x:  uuid-runtime  --	Laufzeitkomponenten für die Universally-Unique-ID-Bibliothek
- :x:  xz-utils  --	Komprimierwerkzeuge für das XZ-Format 

- ###  otherosfs  -- 

- :x:  genisoimage  --	Erzeugt ISO-9660 Dateisystemabbilder für CD-ROMs - im mc image.iso Dateien ansehen

[//]: # (Info: Pakete werden warscheinlich nicht mehr unbedingt benötigt - werden als Abhängigkeiten mit installiert )
- :o:  apparmor  --
- :o:  pigz  --

- :o:  dbus  --
- :o:  file  --
- :o:  firmware-linux-free  --
- :o:  libc-l10n  --
- :o:  locales  --
- :o:  python3  --


- ### netzwerk

- :x:  iptables  --	Userspace-Befehlszeilenprogramm, mit dem die Linux-Paketfilterung und der NAT-Regelsatz konfiguriert werden. Es richtet sich an System- und Netzwerkadministratoren.
- :x:  nftables  --	ersetzt die alten populären iptables, ip6tables, arptables und ebtables.

- :x:  ethtool  --	Anzeige oder Änderung von Ethernet-Geräte-Einstellungen

- :x:  wakeonlan  --	Sendet »magische Pakete« zu »Wake-on-LAN«-fähigen Ethernet-Adaptern


- [o]  openssh-server  -- Ermöglicht Zugriff von Außen, hilfreich für die Entwicklung des Live-Systems
- :o:  openssh-server  -- Ermöglicht Zugriff von Außen, hilfreich für die Entwicklung des Live-Systems


- ###  kernel

- :x:  squashfs-tools  -- Werkzeug zum Erzeugen und Hinzufügen von squashfs-Dateisystemen


