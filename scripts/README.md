Dieses Verzeichnis enthält Skripte, die zum Erstellen des Live-ISOs und des finalen Stick-Images benötigt werden.

⚠️  Es finden weiterhin strukturelle Umbauarbeiten statt 🛠🚧

## Haupt-bau-Skripte
.. sind in dieser Reihenfolge auszuführen, um im Bestfall nach ca. einer Stunde ein fertiges Stick-Image gebaut zu haben.
Im Hauptverzeichnis existiert nun auch ein Makefile, welches diese Schritte direkt ausführt.

* `make iso` => [build-live-iso](build-live-iso): Baut eine bootbare Live-Debian-ISO mittels live-build.
* `make dist-image` => [create-distribution-image](create-distribution-image): Erstellt nach Menüauswahl der ISO ein 10GB Standard-Image für 16GB Sticks
* alternativ:
* `make stick-install` => [stick-install](stick-install): Installiert die Live-ISO menügesteuert auf einem Stick oder in einem Image.

## Hilfsskripte

* [calc-version-number](calc-version-number): "Berechnung einer einfachen und trotzdem präzisen Versionsnummer"
* [convert-md-links](convert-md-links): korrigiert relative Pfade when generating die HTML docs
* [functions.bash](functions.bash): in den Skripten verwendete Funktionen (bash)
* [functions.sh](functions.sh): in den Skripten verwendete Funktionen (POSIX kompatibel)
* [write-and-test](write-and-test): Für die Duplizierung von ganz vielen USB-Sticks (thx @horazont [2016-10-17](https://github.com/fsfw-dresden/usb-live-linux/issues/29#issuecomment-254183176))
