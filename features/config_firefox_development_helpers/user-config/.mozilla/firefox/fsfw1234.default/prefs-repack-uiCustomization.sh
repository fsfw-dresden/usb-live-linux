#!/bin/sh

jq -c . ${@}|sed -r 's/"/\\"/g; s/(.*)/user_pref("browser.uiCustomization.state", "\1");/'

