#!/bin/sh

# remove icon URLs from config for preparing git committing changes
jq 'walk(if type == "object" then with_entries(select(.key|test("icon_url")|not)) else . end)' storage.js | tee storage.cleaned.js
