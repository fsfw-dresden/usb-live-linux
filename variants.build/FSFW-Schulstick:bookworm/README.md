# Der Freie-Software-Freies-Wissen-Schulstick

- eine Lern-, Spiel- und Arbeitsplattform für Schüler von der Grundschule bis zum Abschluss
- mit aktueller Freier Software für viele Anwendungsbereiche
- alle Programme offline und ohne Registrierung oder Installation nutzbar
- eigenes Betriebssystem in der Tasche: startet unabhängig von (und ohne Gefahr für) auf dem Rechner installierter Software
- einfache Benutzeroberfläche und verständliche Dokumentation
- Nachinstallieren weiterer Programme möglich
- mit automatischen Sicherheitsupdates
- Funktion, den Stick bei Problemen komplett oder teilweise zurückzusetzen
- erweiterbar und anpassbar, z.B. auf spezielle Bedürfnisse einer Schule (Stichwort »Schul-Proxy«…)

![Screenshot with Anmerkungen (2021-02-10)](../../doc/screenshot-Xfce-Desktop-2021-02-10.png "Screenshot 2021 Stick with Anmerkungen (2021-02-10)")

Einige weitere Informationen und Screenshots zum Stick-Projekt finden Sie in der [Haupt-Readme](https://github.com/fsfw-dresden/usb-live-linux) dieses Projekt.

## Kostenlose Probesticks
.. gibt es ab sofort für Lehrkräfte aller Schulformen. Füllen Sie dafür einfach unser [Web-Formular](https://survey.opensourceecology.de/index.php?r=survey/index&sid=281135) aus.

## Download und Bespielen eines USB-Sticks
Die aktuelle Version (2405d / 2023-02-23) basiert auf Debian-Linux 11 (stable, codename »bullseye«) mit dem Xfce-Desktop und lässt sich hier herunterladen:

> Image-Datei (11,2 GiB): [FSFW-Schulstick_2405d_Xfce_bullseye-amd64.hybrid.img.gz](https://ftp.inf.tu-dresden.de/os/FSFW/FSFW-Schulstick_2405d_Xfce_bullseye-amd64.hybrid.img.gz)
> zugehörige SHA256-Prüfsumme: `1799bffec8357b7cc6d0a5f4e87fd6889449409ab6bfb4f4a087ad795a04a4a6`

Für die Installation des FSFW-Schulsticks braucht es (mindestens) einen 16-Gigabyte-USB-Stick guter Qualität. Weiterhin braucht man ein spezielles Programm, um das Bespielen durchzuführen. Wir empfehlen dafür den [Etcher](https://www.balena.io/etcher/), den es dort für verschiedene Betriebssysteme zum Download gibt.

Damit einfach die komprimierte Image-Datei auswählen und auf den Stick "flashen". Das Programm verifiziert den erzeugten Stick auch, so dass bei erfolgreich vermeldetem Abschluss der Stick auch funktionieren sollte.
Das Image kann auch für USB-Sticks mit mehr als 16 Gigabyte verwendet werden, da sich die Persistenz-Partition beim ersten Start auf die verfügbare Größe anpasst.

## Verbesserungsvorschläge — Freie Software lebt vom Mitmachen : )

Falls Probleme auftreten, ihr eine Funktion vermisst oder eine Idee habt, wie man etwas besser machen kann: einfach hier auf der Github-Projekt-Seite oben unter "Issues" suchen oder einen neuen Fall anlegen.

## Weitere Pläne (zum Mitmachen!)

- Python/Qt-Portal-App für Open Educational Resources: Tutorials, walk-throughs und Challenges für auf dem Stick vorhandene Software
- Barrierefreiheit prüfen und verbessern
- Multisprach-System (=> Grub Boot-Menü)
- international versions (f.e. India, Africa, Ukraine..)
- gemeinsames Build-Framework mit dem [Lernstick](https://lernstick.ch/)
- siehe auch [doc/Developing-TODO.md](../../doc/Developing-TODO.md)
