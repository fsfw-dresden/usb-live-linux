# LaTeX auf dem FSFW-Stick

LaTeX (sprich: ‚la-tech‘) ist ein Werkzeug zur Erstellung wissenschaftlicher
Dokumente in höchster Qualität.  Es bietet hervorragende Unterstützung für das
Setzen von Formeln, die automatische Aktualisierung von Referenzen, und die
einfache Handhabung von Literaturverzeichnissen und Quellenangaben.  Darüber
kann LaTeX auch für zahlreiche andere Formen von Dokumenten genutzt werden, wie
zum Beispiel Präsentationen, Briefe, und sogar Poster.

Unser FSFW-Stick biete einen einfach Einstieg in die Verwendung von LaTeX.  Dazu
sind auf dem Stick zahlreiche Programme installiert, welche für die grundlegende
Arbeit mit LaTeX bereits vollkommen ausreichend sind.  Diese Programme, ihre
Verwendung, und weiterführende Literatur werden hier im folgenden beschrieben.

## Was ist LaTeX und was kann ich damit machen?

LaTeX unterscheidet sich in seiner Arbeitsweise grundlegend von Programmen wie
Microsoft Word, OpenOffice, oder Libreoffice.  In diesen Programmen werden die
Dokumente gleich so formatiert und angezeigt, wie sie auch später aussehen
sollen.  LaTeX hingegen ist eher eine *Markup-Sprache*, ähnlich zu HTML: das
Dokument wird in einer *Textdatei* als reiner Text angegeben, ohne jegliche
Formatierung (unter Windows sind dies .txt-Dateien).  Die gewünschte
Formatierung wird mit bestimmtem Markup, genannt *Makros*, in dieser Textdatei
kodiert.  Um zum Beispiel einen kurzen Textabschnitt in kursiv zu setzen, wird
nicht einfach in der Textdatei kursiver Text hinterlegt (was ja auch gar nicht
geht).  Stattdessen steht im Dokument dann

    \textit{Ich bin ein Text, der kursiv gesetzt wird.}

Dabei zeigt `\textit` an, dass der von geschweiften Klammern eingeschlossene
Text im Dokument dann kursiv gesetzt werden soll.

Woher kommt dann aber aus dieser Textdatei, der *LaTeX-Quelldatei*, ein schön
formatiertes Dokument?  Dazu gibt es Programme, welche die LaTeX-Quelldatei in
zum Beispiel ein PDF übersetzen.  Dabei werden die ganzen Formatierungsbefehle
in ihre entsprechende Formatierung konvertiert.  Das obige Beispiel wird dann im
endgültigen PDF-Dokument als kursiver Text erscheinen.

Das klingt alles erstmal ziemlich kompliziert, und tatsächlich ist die Lernkurve
für LaTeX am Anfang wesentlich höher als zum Beispiel für Word.  Allerdings
bringt LaTeX gerade bei der Verarbeitung größerer Dokumente viele Vorteile mit
sich.  Solche Vorteile sind die automatische Verwaltung von Verweisen auf
Textabschnitte, Formeln, Abbildung und Tabellen, die automatische Erstellung von
Literatur- und Quellenverzeichnissen, die mühelose Angabe komplexer
mathematischer Formeln und insbesondere die Einhaltung eines einheitlichen
Aussehens im Dokument.  Der Mehraufwand, den man bei LaTeX betreiben muss, zahlt
sich aber schon bei Dokumenten mittlerer Größe aus.

Zusätzlich gibt es eine Reihe von Programmen, die einen bei der Arbeit mit LaTeX
unterstützen.  Eines dieser Programmen ist *TeXStudio* und ist auf diesem Stick
installiert.  Damit lassen sich einfach komplexe Dokumente erstellen und schnell
in die gewünschte Ausgabe transformieren.

## Beispiel 1: Eine Vorlage für Diplomarbeiten

Typischerweise fängt man nicht mit einer leeren Datei, sondern mit einer passenden
Vorlage an. Von manchen Instituten werden solche Vorlagen für ihre Studierenden
bereitgestellt, z.B. [hier](https://tu-dresden.de/ing/elektrotechnik/rst/studium/downloads)
vom Institut für Regelungs- und Steuerungstheorie.

Wir haben eine eigene Vorlage (hier am Beispiel einer Diplomarbeit) erstellt
und auf den Stick gepackt: [→Link zur Vorlage](../latex-vorlage/abschlussarbeit/muster-diplomarbeit.tex).
Die Datei öffnet sich in TeXStudio, und von dort aus kann man sie durch Drücken
von F6 oder durch Klicken auf den grünen Pfeil in ein
[PDF](../latex-vorlage/abschlussarbeit/muster-diplomarbeit.pdf)
konvertieren. Mit F7 wird diese Datei dann angezeigt.

Vielleicht ist nicht sofort alles klar, was in der Vorlage passiert. Das ist
nicht schlimm, denn um LaTeX sinnvoll nutzen zu können, muss man nicht alles
über LaTeX wissen. Dennoch hilft es, wenn man sich die Datei genauer ansieht
und mit den Kommandos herumspielt, also Anweisungen verändert und dann neu
übersetzt.

## Beispiel 2: Eine Vorlage für Präsentationen
Mit LaTeX kann man auch relativ einfach eine Präsentation erstellen.
Insbesondere wenn man keine aufwendigen Animationen will oder wenn man Wert auf ansprechende Darstellung
von mathematischen Formeln legt ist das ein sehr empfehlenswerter Ansatz.
Um den Einstieg zu erleichtern haben wir auch hierfür eine Vorlage erstellt:
[Quellcode](../latex-vorlage/praesentation/fsfw-beamer-vorlage.tex),
[Ergebnis](../latex-vorlage/praesentation/fsfw-beamer-vorlage.pdf).

## Literatur und Hilfe

Literatur zu LaTeX gibt es reichlich. Hier wird eine kleine Auswahl von
nützlichen Referenzen angeben:

Im Netz:

- Die [Wikipedia](https://en.wikipedia.org/wiki/LaTeX) hat nicht nur einen
  Artikel zu LaTeX, sondern sogar ein sehr
  ausführliches [Wikibook](https://en.wikibooks.org/wiki/LaTeX).

- Bei Problemen mit LaTeX hilft es meistens, in einer Suchmaschine „LaTeX + «was
  will ich machen»“ einzugeben.  Dabei landet man oft auf folgenden Foren:

  - [http://golatex.de/](http://golatex.de/)
  - [http://www.latex-community.org/forum/](http://www.latex-community.org/forum/)
  - [https://tex.stackexchange.com](https://tex.stackexchange.com) (wenn man das als „Forum“ verstehen möchte …)
  - [http://texwelt.de](http://texwelt.de)

  Auch hilfreich ist das [Forum der TU](http://latex.wcms-file3.tu-dresden.de/phpBB3/index.php).

- [texample.net](http://texample.net/) ist eine Beispielsammlung für
  LaTeX-Dokumente mit speziellen Fokus auf Bildern

- Wer die Installation von LaTeX auf seinem eigenen Rechner scheut, kann es auch
  online unter https://www.sharelatex.com/ nutzen.

- Wenn man einfach nur wissen will wie man ein bestimmtes (mathematisches) Symbol in LaTeX erzeugt,
  hilft [http://detexify.kirelabs.org](http://detexify.kirelabs.org/classify.html).

- Wer wissen will, was alles so in LaTeX möglich ist, kann sich im
  [*Comprehensive TeX Archive Network*](https://www.ctan.org/) umsehen.

Eine Reihe von Büchern, die für den Einstieg, aber auch für die Vertiefung in
LaTeX hilfreich sind, bietet
die [*Deutsche Anwendervereinigung TeX e.V.*](http://www.dante.de) auf
ihrer [Literaturliste](http://www.dante.de/index/Literatur.html); ansonsten
einfach in der SLUB nachsehen, was es dort für Bücher zum Thema LaTeX gibt.

Schließlich gibt es auch in regelmäßigen Abständen die
[LaTeX-Sprechstunde](https://wiki.fsfw-dresden.de/doku.php/doku/sprechstunde).
Häufig gestellte Fragen in dieser Sprechstunde sammeln wir in
einer [FAQ](https://wiki.fsfw-dresden.de/doku.php/doku/latex/latex_tips).

## Noch mehr Details: Was bring der Stick für LaTeX mit?

Der Uni-Stick liefert eine reichhaltige TeX-Installation mit allen notwendigen
Paketen, die gerade für das akademische Arbeiten hilfreich sind, zum Beispiel:

- Eine *LaTeX-Distribution* ([TeXLive 2016][]), die neben den
  Übersetzungsprogrammen für LaTeX-Quelldateien alle wesentlichen Komponenten
  für die Arbeit mit LaTeX mitbringt.

- Viele Zusatzpakete, die gerade zur akademischen Arbeit sinnvoll sind, z.B. für
  Präsentationen ([beamer][]), Diagramme ([tikz][], [pstricks][]), verschiedene
  Zitierstile (via bibtex oder [biblatex][]) und mehr.  Eine gute Übersicht über
  die verfügbaren Pakete und weitere Dokumentation gibt das Programm `texdoctk`.

- Dokumentation zu fast jedem Paket und Werkzeug, welches auch installiert ist.
  Diese Dokumentation lässt sich am besten mit `texdoc` aufrufen.  Für das Paket
  `babel` etwa wäre der Aufruf `texdoc babel` auf der Kommandozeile.  Eine
  kurze [Einführung in LaTeX][] selbst lässt sich durch `texdoc l2kurz`
  anzeigen.

- Werkzeuge zum Arbeiten mit LaTeX und drumherum, z.B. [TeXStudio][]
  (LaTeX-Editor) und [pdfjam][] (Manipulation von PDF Dokumenten auf der
  Kommandozeile.

[beamer]: https://www.ctan.org/pkg/beamer
[tikz]: https://www.ctan.org/pkg/pgf
[pstricks]: https://www.ctan.org/pkg/pstricks-base
[biblatex]: https://www.ctan.org/pkg/biblatex
[Einführung in LaTeX]: https://www.ctan.org/pkg/lshort-german
[TeXLive 2016]: https://www.tug.org/texlive/
[TeXStudio]: http://www.texstudio.org
[pdfjam]: http://www2.warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam
