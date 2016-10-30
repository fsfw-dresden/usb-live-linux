## Branches

Mit *Branches* können verschiedene Varianten, ausgehend von einem gemeinsamen Versionsstand, gleichzeitig und im selben Repo vorgehalten werden. Die (Wieder-)zusammenführung von Branches wird als *Merge* bezeichnet.

Größere Änderungen sollten in einem eigenem Branch erfolgen und erst nach dessen Test gemerged werden. Gern kann hierfür ein Pullrequest gestellt werden.
Branches sollten der übersichtlichkeit nach folgendem Namensschema aufgebaut sein: '<Namenskürzel>_<Branchname>'. Beides sollte kurz, eindeutig und möglichst aussagekräftig sein. (Achtung: Einige Sonderzeichen wie z.B. der "/" können zu Problemen führen.)
Idealerweise werden Branches in *Issues* referenziert und gelöscht sobald sie nicht mehr gebraucht werden.

## Pullrequest

Ein *Pullrequest* ist als *Aufforderung zum Mergen* verschiedener *Branches* zu verstehen.

Pullrequest sind möglichst aussagekräftig zu benennen und zu beschreiben. Sie sollten zeitnah gemerged oder wenigstens kommentiert werden.


## Kein Merge ohne Test

Bevor ein Pullrequest angenommen (also ein Branch mit einem anderen gemerged wird) ist er zu testen und das Ergebnis idealerweise zu dokumentieren - etwa als kurzer Kommentar im Pullrequest.

Wenn Ihr z.B. ein Paket in der Liste ergänzt, baut das Image erstmal und überprüft die Funktion der betroffenen Programme.
