#!/bin/bash

# Dieses Skript wird beim Start von KDE automatisch ausgeführt.



sleep 2

# das dolphin-Fenster schließen, durch eine ungünstige Konfiguration am Anfang aufgeht
killall dolphin


# Unsere Startseite laden
nohup firefox /home/user/FSFW-Material/stick-doku/index.html
