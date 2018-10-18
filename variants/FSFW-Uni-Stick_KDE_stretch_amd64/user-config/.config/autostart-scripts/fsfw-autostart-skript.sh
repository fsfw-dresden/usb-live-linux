#!/bin/bash

# Dieses Skript wird beim Start von KDE automatisch ausgeführt.
sleep 2

# Unsere Startseite laden
pgrep firefox || nohup firefox ~/FSFW-Material/stick-doku/index.html
