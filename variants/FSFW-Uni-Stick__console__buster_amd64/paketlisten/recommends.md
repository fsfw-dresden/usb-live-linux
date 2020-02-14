##  system tools  --

- ###  recommends  -- Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- :x:  user-setup  -- Set up initial user and password
- :x:  sudo  -- gewährt begrenzte Root-Privilegien für bestimmte Benutzer
- :x:  keyboard-configuration  -- Systemweite Tastatureinstellungen

- ###  recomments debootstrap variant=minbase  -- 

- :x:  libatm1  --
- :x:  libnss-systemd  --
- :x:  libpam-cap  --
- :x:  libpam-systemd  --	dbus systemd-sysv

- ###  Pakete die installiert werden sollten wenn > lb config --debootstrap-options --variant=minbase < verwendet wird - sonst kein Netzwerk verfügbar

- :x:  netbase  --  Grundlegendes TCP/IP-Netzwerksystem
- :x:  iputils-ping  --
- :x:  isc-dhcp-client  -- iproute2  libdns-export1104  libisc-export1100
- :x:  isc-dhcp-common  --

- :x:  ifupdown  --  Werkzeuge zum Konfigurieren von Netzwerkschnittstellen (ohne ifupdown -- dhclient manuell ausführen)

- ###  utils-recommends  -- Pakete die installiert werden sollten wenn > lb config --apt-recommends < verwendet wird

- :x:  bzip2  --	Qualitativ hochwertiger, Blöcke sortierender Dateipacker
- :x:  unzip  --	Entpacker für .zip-Dateien
- :x:  rsync  --	Schnelles, vielseitiges Kopierwerkzeug für entfernte (und lokale) Dateien
- :x:  uuid-runtime  --	Laufzeitkomponenten für die Universally-Unique-ID-Bibliothek
- :x:  xz-utils  --	Komprimierwerkzeuge für das XZ-Format 
