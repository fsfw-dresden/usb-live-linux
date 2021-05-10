# Der Freie-Software-Freies-Wissen-Schulstick

- Live-Demo ohne Download direkt in Ihrem Webbrowser: https://distrotest.net/Schulstick%20Linux/2021.4
- eine Lern-, Spiel- und Arbeitsplattform für Schüler von der Grundschule bis zum Abschluss
- mit aktueller Freier Software für viele Anwendungsbereiche
- eigenes Betriebssystem in der Tasche: lässt sich unabhängig von und ohne Gefahr für auf einem Rechner installierter Software starten
- einfache Benutzeroberfläche und verständliche Dokumentation
- Nachinstallieren weiterer Programme möglich
- mit automatischen Sicherheitsupdates
- Funktion, den Stick bei Problemen komplett oder teilweise zurückzusetzen
- erweiterbar und anpassbar, z.B. auf spezielle Bedürfnisse einer Schule (Stichwort »Schul-Proxy«…)

![Screenshot with Anmerkungen (2021-02-10)](../../doc/screenshot-Xfce-Desktop-2021-02-10.png "Screenshot 2021 Stick with Anmerkungen (2021-02-10)")

## Notiz zur Kurzvorstellung in der Deutschlandfunk-Sendung Campus & Karriere am 27. März 2021

Mit etwas Verspätung hat es ein April-Release über die Ziellinie geschafft, das Sie im folgenden Abschnitt verlinkt finden. Falls Sie von unser kommenden Aktion, bei der Sie als Lehrer kostenlos einen von hundert Probesticks zu erhalten könnenn, erfahren wollen, tragen Sie sich gerne auf https://fsfw-dresden.de/ in unsere News-Mailingliste ein.

Einige weitere Informationen und Screenshots zum Stick-Projekt finden Sie in der [Haupt-Readme](https://github.com/fsfw-dresden/usb-live-linux) dieses Projekt.

## Download und Bespielen eines USB-Sticks

Die aktuelle Version (1734v / 2021-04-24) basiert auf Debian-Linux 10 (stable, codename »buster«) und dem Xfce-Desktop.

Für die Installation des FSFW-Schulsticks braucht es (mindestens) einen 16-Gigabyte-USB-Stick guter Qualität. Weiterhin braucht man ein spezielles Programm, um das Bespielen durchzuführen. Wir empfehlen dafür den [Etcher](https://www.balena.io/etcher/), den es dort für verschiedene Betriebssysteme zum Download gibt.

> Image-Datei (7,5 GiB): [FSFW-Schulstick_1734v_Xfce_buster-amd64.img.gz](https://web.fsr.mw.tu-dresden.de/dateien/FSFW_Schulstick_2021/FSFW-Schulstick_1734v_Xfce_buster-amd64.img.gz)  
> dazugehörige SHA256-Prüfsumme: [FSFW-Schulstick_1734v_Xfce_buster-amd64.img.gz.sha256sum](https://web.fsr.mw.tu-dresden.de/dateien/FSFW_Schulstick_2021/FSFW-Schulstick_1734v_Xfce_buster-amd64.img.gz.sha256sum)

Damit einfach die komprimierte Image-Datei auswählen und auf den Stick "flashen". Das Programm verifiziert den erzeugten Stick auch, so dass bei erfolgreich vermeldetem Abschluss der Stick auch funktionieren sollte.
Das Image kann auch für USB-Sticks mit mehr als 16 Gigabyte verwendet werden, da sich die Persistenz-Partition beim ersten Start auf dieverfügbare Größe anpasst.

## Verbesserungsvorschläge — Freie Software lebt vom Mitmachen : )

Falls Probleme auftreten, ihr eine Funktion vermisst oder eine Idee habt, wie man etwas besser machen kann: einfach hier auf der Github-Projekt-Seite oben unter "Issues" suchen oder einen neuen Fall anlegen.

## Weitere Pläne / Kompetenzen gesucht

- Tutorials, walk-throughs und Challenges für auf dem Stick vorhandene Software
- Barrierefreiheit
- Multisprach-System (=> Grub Boot-Menü)
- international versions (India Africa)
- Synergien mit dem Lernstick
- ein eigenes apt-Repositorum
- …
