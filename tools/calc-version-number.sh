#!/bin/bash
# Skript zur Berechnung einer einfachen und trotzdem präzisen Versionsnummer
# Differenztage zwischen dem ersten commit und dem aktuellen HEAD des git repos.
# Bei Zahlen größer als 999 (knapp 3 Jahre) wird Hunderter-Stelle als Buchstabe ausgeführt.
# a = 1100, b = 1200,..., z = 3600 (knapp zehn Jahre) (ist noch nicht implementiert).
# Stundenanteil der Uhrzeit wird als Buchstabe a-x (entspricht 0-23) repräsentiert


# Diese Versionsnummer eignet sich auch für das ISO



# Zeitstempel des ersten commits 
# first_commit=`git rev-list --max-parents=0 HEAD`
# git log  $first_commit --pretty=format:%ct
TIME_STAMP_FC=1469312346
#NOW=`date "+%s"`
TIME_STAMP_LC=`git log -1 HEAD --pretty=format:%ct`

# Anzahl der Differenztage bestimmen und auf zwei Kommastellen runden
# Dazu folgenden Pythoncode ausführen


PYTHON_CODE=$(cat <<END
import math
diff_days = ($TIME_STAMP_LC - $TIME_STAMP_FC)/3600.0/24.0

# Nachkommteil abspalten
dec_part, int_part = math.modf(diff_days);

# Nachkommteil auf 0...23 abbilden
index = int(dec_part*24);

# in Buchstabe umwandeln
print('%i%s' % (int_part, chr(97 + index)))

END
)

VERSION="$(python3 -c "$PYTHON_CODE")"

echo "$VERSION"
