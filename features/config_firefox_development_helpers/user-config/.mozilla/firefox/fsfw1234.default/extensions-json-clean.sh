#!/bin/sh
# Helper script to reduce the JSON madness to git-friendly proportions by
# removing (often voluminous) locales-entries, other keys not found necessary to work and entries for system-wide or factory mozilla.org addons
FILE="${*:-extensions.json}"
JQCODE='
del
(
        .addons[] |
               select( .location != "app-profile" ),
               .active,
               .appDisabled,
               .applyBackgroundUpdates,
               .blocklistState,
               .embedderDisabled,
               .foreignInstall,
               .hidden,
               .icons,
               .incognito,
               .installDate,
               .installTelemetryInfo,
               .locales,
               .optionalPermissions,
               .optionsBrowserStyle,
               .optionsType,
               .optionsURL,
               .path,
               .recommendationState,
               .rootURI,
               .signedDate,
               .signedState,
               .skinnable,
               .softDisabled,
               .strictCompatibility,
               .syncGUID,
               .targetApplications,
               .targetPlatforms,
               .updateDate,
               .userDisabled
) | del
(
        ( .addons[].dependencies | select( length == 0 ) ),
        ( .addons[][] | nulls ),
        ( .addons[][][]? | nulls )
)'

jq "${JQCODE}" "${FILE}" | tee "${FILE%.json}.cleaned.json"
