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
Dokument gleich so formatiert und angezeigt, wie sie auch später aussehen
sollen.  LaTeX hingegen ist eher eine *Markup-Sprache*, ähnlich zu HTML: das
Dokument wird in einer *Textdatei* als reiner Text angegeben, ohne jegliche
Formatierung (unter Windows sind diest .txt-Dateien).  Die gewünschte
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

## Beispiele

Hier sollen dann ein paar Links zu Beispieldateien stehen, zusammen mit
Anleitungen, wie man aus diesen ein Dokument bekommt.

## Literatur

Im Netz:

- http://texample.net/
- http://www.latex-community.org/forum/
- https://tex.stackexchange.com
- https://de.wikibooks.org/wiki/LaTeX-Kompendium
- http://www.dante.de/
- https://www.ctan.org/
- Mehr?

Als Bücher:

- Wer liest schon Bücher?
- Mehr?

Noch:

- Wikipedia
- sharelatex

## Noch mehr Details: Was bring der Stick für LaTeX mit?

- Grundlegende Teile von TeXLive 2015(?) als LaTeX-Distribution
- Zusatzpakete, die gerade zur akademischen Arbeit sinnvoll sind (z.B. beamer,
  tikz, …)
- Dokumentation (hier könnte man noch texdoc erwähnen)
- Werkzeuge (pdfjam, texstudio)

Aus der Übersicht; die bleibt nicht hier, aber zum Schreiben der Dokumentation
ist sie sehr hilfreich.

- :x:  texlive
- :x:  texlive-base
- :x:  texlive-bibtex-extra
- :x:  texlive-binaries
- :x:  texlive-doc-de
- :x:  texlive-extra-utils  --		für pdfjam (pdf90)
- :x:  texlive-font-utils
- :x:  texlive-fonts-extra
- :x:  texlive-fonts-extra-doc
- :x:  texlive-fonts-recommended
- :x:  texlive-fonts-recommended-doc
- :x:  texlive-formats-extra
- :x:  texlive-generic-recommended
- :x:  texlive-lang-german
- :x:  texlive-latex-base
- :x:  texlive-latex-base-doc
- :x:  texlive-latex-extra  --		gut für Beamer-presentation
- :x:  texlive-latex-extra-doc
- :x:  texlive-latex-recommended
- :x:  texlive-latex-recommended-doc
- :x:  texlive-luatex
- :x:  texlive-math-extra
- :x:  texlive-pictures
- :x:  texlive-pictures-doc
- :x:  texlive-plain-extra
- :x:  texlive-pstricks
- :x:  texlive-pstricks-doc
- :x:  texlive-publishers
- :x:  texlive-publishers-doc
- :x:  texlive-xetex
- :x:  texstudio  --			LaTeX-Editor - GUI
- :x:  texstudio-doc
- :x:  texstudio-l10n


