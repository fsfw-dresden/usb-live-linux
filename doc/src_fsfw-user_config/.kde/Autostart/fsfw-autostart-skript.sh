#!/bin/bash

# Dieses Skript wird beim Start von KDE automatisch ausgeführt.



#sleep 2


# das dolphin-Fenster schließen, das durch eine ungünstige Konfiguration am Anfang aufgeht
# (Das ist inzwischen Überflüssig und kann demnächst gelöscht werden)
#killall dolphin


# Unsere Startseite laden
nohup firefox /home/user/FSFW-Material/stick-doku/index.html &

# Beim ersten Start erscheint nun zusätzlich im Webbrowser eine Begrüßungsseite des Zotero-Plugins...
#...um unsere Startseite wieder in den Vordergrund zu bringen, folgender Workaround.
sleep 5
nohup firefox /home/user/FSFW-Material/stick-doku/index.html
