# WLAN (Eduroam) einrichten (2018er Stick-Version: KDE)

An der TU Dresden gibt es flächendeckend WLAN. Relevant für die Allgemeinheit sind davon zwei:
"eduroam" und "VPN/Web". Beide werden vom ZIH betrieben.


## eduroam (Empfehlenswert)
Das eduroam wird an sehr vielen Bildungseinrichtungen deutschlandweit angeboten, in Dresden
z.B. an der TU, der HTW und der SLUB. D.h. einmal einrichten - überall nutzen.

- Benutzername:  <ZIH-Login>@tu-dresden.de
- Passwort: <ZIH-Passwort> oder separat eingerichtetes WLAN-Passwort

Das für die Authentifizierung notwendige Zertifikat kann man vom ZIH
[herunterladen](https://tu-dresden.de/zih/dienste/ressourcen/dateien/rootcert.crt) - praktischerweise
ist es aber auch schon auf dem UniStick: `FSFW-Material/eduroam-zertifikat/tud-cacert.pem`.

Damit kann die Konfiguration des Netzwerks vorgenommen werden:

![ ](wlan_config1.png)

![ ](wlan_config2.png)

![ ](wlan_config3.png)


Mehr Informationen zum eduroam gibt es beim [ZIH](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/zugang_datennetz/index/#section-1-1).

## VPN/Web (Plan B)

Dieses WLAN steht als Rückfall-Variante zur Verfügung.
Bevor man es nutzen kann muss man sich (jedes mal) über die Web-Oberfläche einloggen:

- Benutzername:  <ZIH-Login>@tu-dresden.de
- Passwort: <ZIH-Passwort>

Mehr Informationen zum VPN/Web gibt es beim [ZIH](https://tu-dresden.de/zih/dienste/service-katalog/arbeitsumgebung/zugang_datennetz/index/#section-2).
