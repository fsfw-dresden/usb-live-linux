## Allgemeines

Das Projekt "FSFW-Uni-Stick" der FSFW Dresden ist explizit darauf angelegt auch für andere Hochschulen nützlich zu sein. Wir freuen uns deshlab über Beiträge zu diesem Projekt, über [Feedback](https://fsfw-dresden.de/#kontakt) und über Pullrequests.

Die Dokumentation ist noch im Aufbau begriffen. Neben dieser Datei ist das Verzeichnis [dev_doc/src](doc/dev_doc/src/) für die Entwickler\*innen-Doku relevant.

## Branches

Mit *Branches* können verschiedene Varianten, ausgehend von einem gemeinsamen Versionsstand, gleichzeitig und im selben Repo vorgehalten werden. Die (Wieder-)zusammenführung von Branches wird als *Merge* bezeichnet.

Größere Änderungen sollten in einem eigenem Branch erfolgen und erst nach dessen Test gemerged werden. Im Normalfall sollte hierfür ein Pullrequest gestellt werden.

**Bitte beachten:** Um die Übersicht zu bewahren, verwenden wir das Branching-Modell [git flow](http://nvie.com/posts/a-successful-git-branching-model/). 

Neue Features-Zweige sollten der nach folgendem Namensschema aufgebaut sein: 'feature\_\<Person\>\_\<thema-bzw-issue\>'. Beides sollte kurz, eindeutig und möglichst aussagekräftig sein. Im Branchname sind möglichst keine Sonderzeichen außer `_` und `-`  zu verwenden. Idealerweise werden Branches in *Issues* referenziert und gelöscht sobald sie nicht mehr gebraucht werden.

## Pullrequest

Ein *Pullrequest* ist als *Aufforderung zum Mergen* verschiedener *Branches* zu verstehen.

Pullrequest sind möglichst aussagekräftig zu benennen und zu beschreiben. Sie sollten zeitnah gemerged oder wenigstens kommentiert werden.


## Feature-Beschreibung und Vorgehen beim Testen (Wichtig!)

Leider gibt es noch keine gute Möglichkeit, unsere gewünschten Funktionen automatisiert zu testen. Deswegen ist manuelles Testen notwendig. Damit dabei nichts vergessen wird gibt es die Datei: [CHECKLIST.md](doc/dev_doc/src/CHECKLIST.md). Diese enthält die Beschreibung worauf man beim Testen achten sollte. Neue Features sind vor dem Erstellen eines PRs dort zu dokumentieren.

Bevor ein Pullrequest angenommen (also ein Branch mit einem anderen gemerged wird) ist er zu testen und das Ergebnis idealerweise zu dokumentieren - etwa als kurzer Kommentar im Pullrequest.

Wer z.B. ein Paket in der Liste ergänzt, baut das Image erstmal und überprüft die Funktion der betroffenen Programme.

## Tipps
Wenn man im gebooteten Live-Image etwas über ein Konfigurationsmenü ändert und wissen möchte, welche Dateien davon betroffen sind:
* das komplette $HOME vorher in ein git-repo einchecken
* nach der Änderung wieder committen
* Optional vom Host mit sshfs auf das (vermutlich in einer VM) gebootete Image zugreifen und die Änderungen in die user-config übernehmen


