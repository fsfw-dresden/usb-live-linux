[//]: # (Das ist ein Markdown-Kommentar; Text wird nicht gerendert)
[//]: # (Carsten: Vorschlag: wir können diese Syntax nutzen, um Kommentare in die Liste zu schreiben, ohne die Markdown-Synax zu zerstören.)


# Paketliste für FSFW UNI Stick (USB-Live-Stick) 

>  zum automatisierten erstellen der Paketlisten aus dieser Doku Paketliste
>  ` $ auto/paketliste `   --  im live-build-Verzeichnis ausführen
>
>
> ##  Syntax für die Paketlisten
>
> #### Programme die auf dem Stick sind / sein sollen (...list.chroot)
>
> - ###  Virtuelle Paketliste  - Task List
>
>     __vor und hinter dem Paket- und Listennamen zwei Leerzeichen verwenden__
>
> - :x:  Paket ausgewählt  -- kurze Info / Beschreibung (wofür braucht man das ?)
>	- Info zum Programm
>	  - Beschreibung / Erklärungen
>
> - :o:  Paket nicht ausgewählt
>
> - :+1:  Paket vorschlag - Abstimmung im Plenum (reguläre Treffen) folgt 	-- Beschreibung
>
> - :o: :-1:  Paket derzeit nicht benutzt weil 	-- Beschreibung
>
> #### Programme die auf dem Stick als Paket verfügbar sind, aber noch nicht installiert sind (...list.binary)
>
> - [x]  Programm (Paket) auf dem Stick verfügbar 
>
> - [ ]  Programm (Paket) vorschlag 
>
[//]: # (Carsten: Ich verstehe noch nicht ganz den Sinn, Pakete auf dem Stick vorzuhalten, aber sie noch nicht zu installieren)
[//]: # (Gerd: Firmware, Treiber z.B. Grafik Nvidia gibt es in verschiedenen varianten und können untereinander kollidieren, leichteres anpassen auch ohne Netz - nur im "persistence mode" bleiben die geänderten Einstellung erhalten )
>
> #### Anmerkungen / Fragen / Kommentare
> - am besten als Markdown-Kommentare in den Quelltext
> - Syntax:
>  `[//]: # (Name: Das ist ein Markdown-Kommentar und wird nicht mit gerendert.)`
>
> - Siehe auch den Quelltext dieser Datei
> - Zur lokalen Vorschau eignet sich z.B. [https://github.com/joeyespo/grip](https://github.com/joeyespo/grip)
> 
> ## Wie diese Liste erstellt wurde...
> 
> Nach einigen Trial&Error-Versuchen Programmnamen von Hand in die Liste zu schreiben, wobei sich immerwieder gemeine Schreibfehler einschlichen, schuf eine grafische Sofwarepaketverwaltung (synaptic) abhilfe. Leider fiel es nun schwer herauszubekommen welche der ca. 2000 Programmpakete nun die tatsächlich gewünschten waren und welche nur automatisch zur Erfüllung von Paketabhängigkeiten mitinstalliert wurden. *apt-mark* und *aptitude* sorgten hier nun für Abhilfe.
> 
> Also einfach
> 
> 1. Die als *manuell installierten* Pakete mit `apt-mark showmanual > meine_Paketliste.alt.list` exportieren
> 2. Die gewünschten Pakete in `aptitude` installieren (sie werden dann automatisch als "*manuell installiert*" markiert)
> 3. Die als *manuell installierten* Pakete mit `apt-mark showmanual > meine_Paketliste.neu.list` exportieren
> 3. Alte und neue Paketliste abgleichen und Änderungen übernehmen (Dateivergleicher wie *meld*, *comm* oder *diff* helfen hierbei).

> TODO: Durchsehen und ggf. in andere Listen über nehmen.


##  WeiterePakete

- :+1:  arduino  
- :+1:  arduino-mk  
- :+1:  avrdude-doc  
- :+1:  avrprog  
- :+1:  # dblatex  
- :+1:  debconf-kde-helper  
- :+1:  debian-faq  
- :+1:  discover  
- :+1:  dkms  
- :+1:  # doc-debian  
- :+1:  doxygen-doc  
- :+1:  ebtables  
- :+1:  ethtool  
- :+1:  # fbset  
- :+1:  focuswriter  
- :+1:  fonts-mathjax-extras  
- :+1:  fonts-stix  
- :+1:  gcc-doc  
- :+1:  gdb-doc  
- :+1:  gimp-dcraw  
- :+1:  git-doc  
- :+1:  gnuplot-doc  
- :+1:  graphviz-doc  
- :+1:  gstreamer0.10-pocketsphinx  
- :+1:  hp-ppd  
- :+1:  htdig  
- :+1:  hyphen-de  
- :+1:  ipython3-qtconsole  
- :+1:  irqbalance  
- :+1:  # kalarm  
- :+1:  # kamoso  
- :+1:  kde-config-cddb  
- :+1:  kdeconnect  
- :+1:  kdepim  
- :+1:  kde-standard  
- :+1:  kio-mtp  
- :+1:  kjots  
- :+1:  kleopatra  
- :+1:  klettres  
- :+1:  kmplot  
- :+1:  knode  
- :+1:  krecipes  
- :+1:  krecipes-doc  
- :+1:  kteatime  
- :+1:  ktimetracker  
- :+1:  ktouch  
- :+1:  latex2html  
- :+1:  lib32ncurses5  
- :+1:  lib32ncursesw5  
- :+1:  lib32stdc++6  
- :+1:  lib32z1  
- :+1:  libatm1  
- :+1:  libjs-mathjax-doc  
- :+1:  logisim  
- :+1:  lsof  
- :+1:  man2html-base  
- :+1:  maven  
- :+1:  maxima-doc  
- :+1:  plasma-netbook  
- :+1:  postgresql  
- :+1:  python3-dev  
- :+1:  python3-matplotlib  
- :+1:  python3-numpy  
- :+1:  python3-pip  
- :+1:  python3-scipy  
- :+1:  python-gnuplot  
- :+1:  python-numpy-doc  
- :+1:  qemu-kvm  
- :+1:  # qtgstreamer-plugins  
- :+1:  qtoctave  
- :+1:  routino  
- :+1:  tex4ht  
- :+1:  uisp  
- :+1:  unixodbc  
- :+1:  usbprog  
- :+1:  usbprog-gui  
- :+1:  vbetool  
- :+1:  vim-doc  
- :+1:  virtualbox-qt  
- :+1:  # wayv  
- :+1:  winff-doc  
- :+1:  wireshark-doc  
- :+1:  # xfce4-goodies  
