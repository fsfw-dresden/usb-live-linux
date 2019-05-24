## Allgemeines

Das Projekt "FSFW-Uni-Stick" der FSFW Dresden ist explizit darauf angelegt, auch für andere Hochschulen nützlich zu sein. Wir freuen uns deshalb über Beiträge zu diesem Projekt, über [Feedback](https://fsfw-dresden.de/#kontakt) und über Pullrequests.

## Features & Branches

**Bitte beachten:** Aktuell verwenden wir das Branching-Modell [git flow](http://nvie.com/posts/a-successful-git-branching-model/). 

Neue Feature-Zweige sollten der nach folgendem Namensschema aufgebaut sein: 'feature\_\<thema-bzw-issue\>'. Die Bezeichnung sollte kurz, eindeutig und möglichst aussagekräftig sein. Im Branchname sind möglichst keine Sonderzeichen außer `_` und `-`  zu verwenden. Idealerweise werden Branches in *Issues* referenziert und **gelöscht sobald sie nicht mehr gebraucht werden**.

## Änderungen Testen (Wichtig!)

Bisher haben wir noch keine automatischen Tests erstellt (=> https://ldtp.freedesktop.org Linux Desktop Testing Project: Cross Platform GUI Test Automation tool).

Deswegen ist manuelles Testen notwendig. In der Datei [Developing-CHECKLIST.md](doc/Developing-CHECKLIST.md) ist die zu prüfende Funktionalität beschrieben. Neue Features sind vor dem Erstellen eines PRs dort zu dokumentieren.

Bevor ein Pullrequest angenommen (also ein Branch mit einem anderen gemerged) wird, ist er zu testen und das Ergebnis idealerweise zu dokumentieren - etwa als kurzer Kommentar im Pullrequest.

Wer z.B. ein Paket in der Liste ergänzt, baut das Image erstmal und überprüft die Funktion der betroffenen Programme.

Stick in einer virtuellen Maschine mittels qemu & kvm testen:

  ` $ sudo kvm -m 2G -hda /dev/sdc`

  * Option -m (Speicher in GB)
  * USB-Stick an /dev/sdc (siehe auch Ausgabe von `lsblk`)

## Tipp
Wenn man im gebooteten Live-Image etwas über ein Konfigurationsmenü ändert und wissen möchte, welche Dateien davon betroffen sind:
* das komplette $HOME vorher in ein git-repo einchecken (`git init; git add -A; git commit -v`)
* nach der Änderung wieder committen (`git add -A; git commit -av`)

