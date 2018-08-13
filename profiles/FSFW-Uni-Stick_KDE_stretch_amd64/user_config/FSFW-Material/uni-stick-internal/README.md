# Übersicht
Diese Datei enthält Informationen zum Test und zur Weiterentwicklung des Live-Images.

Test des Images auf einer Virtuellen Maschine (z.B kvm oder VirtualBox) ist empfehlenswert.
Datei Austausch mit Host-PC z.B. über sftp:

Auf der VM: `sudo apt install openssh-sftp-server openssh-server`

Auf dem Host-PC:

1. (einmalig) eine Portweiterleitung von z.B. TCP-Port 3022 (Host) auf TCP-Port 22 (VM) einrichten
2. Verbindung testen:
  * ssh -p 3022 user@localhost
  * ggf. ist das löschen eines alten ssh-keys nötig. Befehl wird angezeigt.
  * Das Standard-Passwort für den uni-Stick-Benutzer ist `live`.
3. Dateisystem einhängen:
  * sshfs -p 3022 user@localhost:/home/user "/some/mount/point"


Mehr Informationen zum Projekt: https://github.com/fsfw-dresden/usb-live-linux/
und insbesondere hier: https://github.com/fsfw-dresden/usb-live-linux/blob/master/doc/dev_doc/src/CHECKLIST.md

**Wir freuen uns immer über Leute die mitmachen.**
