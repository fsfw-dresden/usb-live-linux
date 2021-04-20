#!/bin/sh

sed -nr '/browser.uiCustomization.state/ { s/\\"/#/g; s/.*"([^"]+)".*/\1/; s/#/"/gp }' ${@:-prefs.js}|jq .|tee ${@:-prefs.js}.uiCustomization.json|jq .
