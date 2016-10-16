#!/bin/bash

# Dieses Skript wird beim Start von KDE automatisch ausgeführt.


# Unsere Startseite laden
nohup firefox /home/user/FSFW-Material/stick-doku/index.html


sleep 2

# das dolphin-Fenster schließen, durch eine ungünstige Konfiguration am Anfang aufgeht
killall dolphin

