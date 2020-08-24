#!/bin/sh
# Helper script to reduce the JSON madness to git-friendly proportions by
# removing (often voluminous) locale-entries and all factory mozilla.org addons
jq 'del(.addons[].locales)|del(.addons[]|select(.id|test(".*mozilla.org$")))' extensions.json | tee extensions.cleaned.json
