#!/bin/bash
#
# Skript erstellt gerdg-dd@gmx.de 2017-09-13
#
#	VERSION: 0.0.4
#
#	CREATED: 2017-09-13
#      REVISION: 2019-06-12

#
# passende System config aktivieren -

echo "FSFW-Uni-Stick System config: variant PATH = ${VARIANT_PATH}  -- variant = ${FSFW_UNI_STICK_VARIANT} "

# link nach config/auto/config erstelen 

rm ./auto/config
ln -s ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT}/config ./auto/config

# system_config übernehmen

echo " system_config ${FSFW_UNI_STICK_VARIANT} schreiben "
rsync -avP ${VARIANT_PATH}/${FSFW_UNI_STICK_VARIANT}/system_config/ config
echo " system_config  configuration fertig."


