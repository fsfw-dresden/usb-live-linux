# The Freie-Software-Freies-Wissen-Stick Project

This is the home of our modular, [Debian](https://debian.org)-based [live](https://wiki.debian.org/DebianLive)-linux-[distribution](https://en.wikipedia.org/wiki/Linux_distribution) targeted at students, learners and makers of all kind.

With this project, we want to provide anyone with a portable and robust computing environment, abundant in possibilities and comfortable to use. It works independently from any installed operating system as it includes a whole software stack ready-to-use, from the [Linux Operating System kernel](https://en.wikipedia.org/wiki/Linux_kernel) to graphical applications for most common tasks.

**Screenshot 2021 Stick, showing some applications (2021-02-10):**
![Screenshot 2021 Stick, showing some applications (2021-02-10)](doc/screenshot_applications_2021-02-18.png "Screenshot 2021 Stick, showing some applications (2021-02-10)")

**Screenshot 2021 Stick with Anmerkungen (2021-02-10):**
![Screenshot 2021 Stick with Anmerkungen (2021-02-10)](doc/screenshot-Xfce-Desktop-2021-02-10.png "Screenshot 2021 Stick with Anmerkungen (2021-02-10)")

**Screenshot 2020 FSFW-Schulstick (2020-04-01):**
![Screenshot FSFW-Schulstick with Xfce Desktop (2020-04-01)](doc/screenshot-Xfce-Desktop-2020-04-01.png "Screenshot FSFW-Schulstick with Xfce Desktop (2020-04-01)")

## Structure and Development
This repository contains shell scripts to create a live-system from a nested tree of feature configuration fragments. These are being fed to Debian's [live-build](https://salsa.debian.org/live-team/live-build) tool, which assembles an ISO file that is then installed to an USB pen drive or into an image file for distribution. Using an appropriate tool, this final image can then be transferred to an USB flash drive.

## Flavors
While the original variant was the [Uni-Stick](variants.build/FSFW-Uni-Stick:Xfce:buster/README.md), we have since been working on bringing the system to [school kids](variants.build/FSFW-Schulstick/README.md) and [makers](variants.build/OSEG-Makerstick/README.md) as well.

## Online Demo
If you would like to test Schulstick Linux online, you can try it live inside your browser at distrotest.net [2021.4 Schulstick Online Demo](https://distrotest.net/Schulstick%20Linux/2021.4).

## Downloads (2021-04-24)
At the moment, the [2021.4 Schulstick release](https://github.com/fsfw-dresden/usb-live-linux/releases/tag/FSFW-Schulstick%2F2021.4) is the only version available for download. It includes most of the functionality of the other build variants though, so we encourage you to try it out instead while we are working on creating release images for the other variants (which we hope to have ready by end of the [decade]).

## Issues and Support
If you hit any problems, just open an issue here on github.

## Language
While the project originally was targeting only German audiences, we are preparing to spin variants for other languages as well, as the system should be very suitable especially for developing world usage scenarios where hardware availability might be an issue.
Because of its German heritage, bits and pieces still might be in German, but to the most part the documentation and code are in English.

## (2019-2020)
Dieses Repo enthält die Skripte und Konfigurationsdateien, die zur Erstellung des angepassten Linux-Live-Systems benötigt werden.
Momentan (Mai 2019) wird noch das Tool  *live-build* benutzt. Mittelfristig ist geplant, das Basis-Image mit `vmdb2` (Nachfolger von `vmdebootstrap`) zu bauen und weitergehende Anpassungen z.B. mittels Ansible-Skripten vorzunehmen. Dabei ist eine Kooperation mit dem [Lernstick-Projekt](https://lernstick.ch/) angestrebt.

## (2018-08)
**Screenshot vom Desktop (2018-08-18):**
![Screenshot](doc/screenshot-KDE-Desktop-2018-08-18.png "Screenshot")

# Weitere Infos:
Aktuelle Informationen (u.a. zur Verteilung vor Ort in Dresden) unter: [https://fsfw-dresden.de/uni-stick](https://fsfw-dresden.de/uni-stick).

## Benutzer.innen Doku:
* [doc/dist/index.md](doc/dist/index.md): Welche Programme sind dabei und wozu sind die gut?
* [scripts/README.md](scripts/README.md): Erstellen eines bootfähigen USB-Sticks mit dem Live-Image

## Entwickler.innen Doku:
* [CONTRIBUTING.md](CONTRIBUTING.md)
* [doc/SWOT-analysis.md](doc/SWOT-analysis.md)
* [doc/Developing-README.md](doc/Developing-README.md)
* [doc/Developing-CHECKLIST.md](doc/Developing-CHECKLIST.md)
* [doc/Developing-TODO.md](doc/Developing-TODO.md)
