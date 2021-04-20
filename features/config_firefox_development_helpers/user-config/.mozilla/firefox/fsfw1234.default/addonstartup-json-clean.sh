#!/bin/sh

# (!) madness awaits those who try to mess with firefox interna

FILE="${*:-addonStartup.json}"

if [ ! -e "${FILE}" ] && [ -e "${FILE}.lz4" ]
then
        unmoz "${FILE}.lz4"
fi

JQCODE='
{
        "app-profile" : ."app-profile" | del
        (
                .. |
                        .dependencies?,
                        .lastModifiedTime?,
                        .loader?,
                        .path?,
                        .runInSafeMode?,
                        .signedDate?,
                        .signedState?,
                        .startupData?,
                        .telemetryKey?

        )
}'

jq "${JQCODE}" "${FILE}" | tee "${FILE%.json}.cleaned.json"
