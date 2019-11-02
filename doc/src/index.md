# Der Uni-Stick der FSFW

Der Uni-Stick der Hochschulgruppe für [Freie Software und Freies Wissen](https://fsfw-dresden.de)
ist ein Projekt, um euch ohne viel Aufwand die Möglichkeiten zum Einsatz Freier Software
(oft auch „Open Source Software“ genannt) in eurem Studium aufzuzeigen.
Was genau auf dem Stick drauf ist, wozu es euch nützlich sein kann,
und warum wir das eigentlich alles machen, wollen wir euch im Folgenden ein wenig erläutern.

Vertiefte Informationen sind dabei auf den folgenden Seiten zu finden:

- [→LaTeX](latex.md)
- [→Freie Software für Windows](windows.md)
- [→Python](python.md)
- [→R](r.md)
- [WLAN (Eduroam) einrichten](wlan.md)

## Rechtliches
Das Linux-Live-System auf dem Stick basiert auf der Distribution
[Debian stable](https://www.debian.org/) und enthält freie Software (und einige
herstellereigene Treiberprogramme, z.B. für die verschiedenen WLAN-Chipsätze).
Der Quellcode zu allen Programmen kann entweder von [debian](https://www.debian.org/)
oder auf [Nachfrage](mailto:kontakt@fsfw-dresden.de) über uns bezogen werden.




## Was soll dieser Stick?

Das Studium ist voller Programme, die wir nutzen wollen oder müssen – egal ob in
den Ingenieurs-, Natur- oder Geisteswissenschaften.  Viele dieser Programme sind
*proprietär*, d.h., sie werden von Anbietern bereitgestellt, die es nicht
erlauben, die Funktionsweise der Programme zu verstehen oder sie zu verändern.
Das hat eine Reihe von negativen Folgen, von denen [Anbieterabhängigkeit][1] nur
eine ist.  Manchmal lässt sich das nicht vermeiden, wie zum Beispiel bei
hochwertigen CAD-Programmen.  Andererseits gibt es viele funktionsfähige *freie*
Programme, die sich für den Alltag im Studium mindestens genauso gut wie ihre proprietären
Gegenstücke eignen.  Diese Programme sind nicht nur kostenlos, sie dürfen auch
in ihrer Funktionsweise untersucht, verändert, und weitergegeben werden.  Das
erlaubt unter anderem Nachvollziehbarkeit, schnelle Beseitigung von Fehlern, und
das Anpassen an spezielle Bedürfnisse.

Eine handverlesene Auswahl an freier Software, die für das Studium hilfreich
sein kann, soll euch dieser Stick bringen.  Das beste daran: der Stick bietet
ein *Linux Live-System*, so dass ihr von diesem Stick ein Linux-System mit viel
toller Software starten könnt, ohne zuerst eine langwierige Installation hinter
euch bringen zu müssen!

[1]: https://en.wikipedia.org/wiki/Vendor_lock-in

## Wobei hilft mir der Stick?

Unser Uni-Stick soll euch helfen, mit freier Software besser durch euer Studium
zu kommen.  Zur Erstellung euer Seminar- oder Abschlussarbeit liefern
wir [LaTeX](latex.md) und [LibreOffice][] mit, für eure Poster bieten
wir [Inkscape][].  Zur mathemtischen Programmieren bekommt ihr [GNU Octave][]
und [Python][], für Statistik gibt es [GNU PSPP][], für Geometrie [geogebra][],
und für Schaltkreisentwurf [qucs][].  Das alles bieten wir euch in
einem [GNU][]/[Linux][]-Live System, welches ihr direkt vom Stick ohne
Installation starten könnt!

Genauer gesagt ist unter anderem folgendes auf dem Stick drauf:

- [KDE][], eine anspruchsvolle graphische Oberfläche mit vielen Einzelprogrammen
- [TeXLive][], eine LaTeX-Distribution, und [TeXStudio][], ein Editor für
  LaTeX-Dokumente; eine kleine Einführung in die Arbeit mit LaTeX findet
  ihr [→hier](latex.md).
- [LibreOffice][], eine freie Alternative zu Microsoft Office
- [FreeCAD][], eine Python/Qt-basierte freie 3D-CAD-Platform (mit Architektur-Werkzeugen, Finite-Elemente, Robotik- & Fluidsimulation) im Aufbau
- [GNU Octave][], eine freie Alternative zu Matlab
- [R-Studio][], grafisches Frontend für [R][] (mächtiges Werkzeug für Statistik und Datenmodellierung, siehe auch: [extra Doku](r.md))
- [geogebra][], ein interaktives Geometrieprogramm
- [Python][], eine vielseitig einsetzbare Skriptsprache (siehe auch: [extra Doku](python.md))
- [GNU PSPP][], eine freie Alternative zu der Statistiksoftware SPSS
- [Thunderbird][] mit Unterstützung für [E-Mail-Verschlüsselung][enigmail]
- [Firefox][], ein freier Webbrowser
- [VLC][], ein ausgezeichneter Mediaplayer
- [Pidgin][] für Instant Messaging
- [Inkscape][], ein vektorbasiertes Zeichenprogramm
- [gimp][], das GNU-Bildbearbeitungsprogramm
- [qucs][], Software zur Simulation elektronischer Schaltungen
- [Audacity][], ein schneller, plattformunabhängiger Audio-Editor
- [gnuplot][], ein mächtiges, kommandozeilengesteuertes Plot-Programm
- [Scribus](https://www.scribus.net/), ein freies Desktop Publishing Werkzeug
- [git][], ein schnelles, skalierbares, verteiltes Revisions-Kontroll-System (siehe auch [FSFW-Git-Workshop](https://fsfw-dresden.de/git-ws))
- [zim][], ein persönliches Desktop-Wiki. Zum Abspeichern von Formeln, Bildern, Zitaten, Ideen, Fragen etc.

[GNU PSPP]: https://www.gnu.org/software/pspp/
[LibreOffice]: https://www.libreoffice.org/
[TeXLive]: https://www.tug.org/texlive/
[qucs]: http://qucs.sourceforge.net/
[Inkscape]: https://inkscape.org/en/
[FreeCAD]: https://www.freecadweb.org/
[GNU Octave]: https://www.gnu.org/software/octave/
[R-Studio]: https://www.rstudio.com/
[R]: https://cran.r-project.org/
[Python]: python.md
[geogebra]: https://www.geogebra.org/
[TeXStudio]: http://www.texstudio.org/
[KDE]: https://www.kde.org/
[Thunderbird]: https://www.mozilla.org/en-US/thunderbird/
[Firefox]: https://www.mozilla.org/en-US/firefox/new/
[VLC]: https://www.videolan.org/vlc/
[Pidgin]: https://pidgin.im/
[gimp]: https://www.gimp.org/
[Audacity]: http://www.audacityteam.org/
[gnuplot]: http://www.gnuplot.info/
[git]: https://git-scm.com/
[Linux]: https://en.wikipedia.org/wiki/Linux
[GNU]: https://www.gnu.org/
[enigmail]: https://www.enigmail.net/index.php/en/
[zim]: http://zim-wiki.org/

Insgesamt sind noch viel mehr Programme im Live-System installiert ([vollständige Paketliste](https://github.com/fsfw-dresden/usb-live-linux/blob/master/doc/FSFW-Uni-Stick_-_Paketliste.md)).
Aber auch wenn ihr unter Windows arbeiten wollt/müsst, kann euch
dieser Stick nützlich sein: auf ihm findet ihr ebenfalls eine [→große Auswahl](windows.md)
an freien Programmen, die unter Windows laufen.

## Über die Hochschulgruppe für [Freie Software und Freies Wissen](https://fsfw-dresden.de)

Die 2014 gegründete Hochschulgruppe “Freie Software, Freies Wissen” (FSFW)
beschäftigt sich mit den technischen sowie gesellschaftlichen Aspekten freier
Software und freien Wissens an der Hochschule.

Unsere Ziele sind unter anderem

- Themenspezifische Bildungsangebote (z. B. Workshops) und Veranstaltungen
- Förderung von sicherer Kommunikation (z. B. Verschlüsselung)
- Nutzungsverbesserung von relevanter Software (z.B. LaTeX)
- Austausch und Vernetzung

Mehr Informationen zum Programm der FSFW gibt es in
unserem [Programmpapier](https://fsfw-dresden.de/programm.html).

Als Hochschulgruppe leben wir vom individuellen Engagement.
Wenn Du Dich für unsere Themen interessierst, komm sehr gerne zum
[Plenum](https://fsfw-dresden.de/#plenum) oder schreibe uns eine [Mail](mailto:kontakt@fsfw-dresden.de)
Dich erwarten coole Leute, eine Menge Erfahrungen und das Gefühl, etwas bewegen zu können.

Die wichtigsten Links von uns für Euch:

- [REgelmäßige Sprechstunde](https://fsfw-dresden.de/sprechstunde) (Für Fragen zu [LaTeX](latex.md), dem Uni-Stick und anderer freier Software)

- [Workshops und Kurse](https://wiki.fsfw-dresden.de/doku.php/doku/vortraege_veranstaltungen_kurse) (git, Python, Mailverschlüsselung, ...)
- [Blog](https://fsfw-dresden.de/blog)
- [Newsletter](https://fsfw-dresden.de/newsletter)
- [Beteiligungsmöglichkeiten](https://fsfw-dresden.de/mitmachen)


Die FSFW bedankt sich herzlich beim [StuRa der HTW Dresden](https://www.stura.htw-dresden.de/), [StuRa der TU Dresden](https://stura.tu-dresden.de/)
für die finanzielle und beim [ZIH](https://zih.tu-dresden.de) für die technische Unterstützung des [Uni-Stick-Projekts](https://fsfw-dresden.de/uni-stick).

Empfehlenswerte Dienste des ZIH und des StuRa:

- [ZIH: Erstsemester-Info](https://tu-dresden.de/zih/dienste/service-desk/ese)
    - Übersichtsseite speziell für Erstsemester
- [ZIH: Cloudstore](https://cloudstore.zih.tu-dresden.de/)
    - Speichern und Austauschen von Dateien (besser als Dropbox etc. (Datenschutz!))
    - [Detailierte Informationen](https://tu-dresden.de/zih/dienste/service-katalog/zusammenarbeiten-und-forschen/datenaustausch/cloudstore/index)
- [ZIH: VPN](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/zugang_datennetz/index)
    - Ermöglicht Zugriff von außen auf TU-Netz
    - Wichtig, z.B. für Zugriff auf Forschungsliteratur
- [StuRa: Etherpad](https://pad.stura.tu-dresden.de)
    - Online-Editor zur gleichzeitigen kollaborativen Text-Bearbeitung
    - [Detail-Infos](https://wiki.stura.tu-dresden.de/doku.php?id=allgemein:dienste:etherpad)
- [StuRa: Kanban](https://kanban.stura.tu-dresden.de/)
    - Werkzeug zur Gruppen Aufgabenkoordination in Gruppen
    - [Detail-Infos](https://wiki.stura.tu-dresden.de/doku.php?id=allgemein:dienste:kanban)
- [StuRa: Only-Office](https://docs.stura.tu-dresden.de/)
    - Datenschutzfreundlicher Ersatz für GoogleDocs
    - [Detail-Infos](https://wiki.stura.tu-dresden.de/doku.php?id=allgemein:dienste:docs)
- [StuRa: Share-LaTeX](https://tex.stura.tu-dresden.de/login)
    - Online-Editor zur gleichzeitigen kollaborativen Bearbeitung von LaTeX-Dokumenten (z.B. Seminararbeiten)
    - [Detail-Infos](https://wiki.stura.tu-dresden.de/doku.php?id=allgemein:dienste:sharelatex)
- Übersicht über alle Dienste des [ZIH](https://tu-dresden.de/zih/die-einrichtung/a-z) und des [StuRa](https://wiki.stura.tu-dresden.de/doku.php?id=allgemein:dienste:start)

