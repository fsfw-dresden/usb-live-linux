#!/bin/bash -xv
#===========================================
#         FILE: md2packagelist
#        USAGE: auto/md2packagelist - ( ausführen im live-build-Verzeichnis )
#  DESCRIPTION: erstellen der Paketlisten für live-build aus den entsprechenden Markdown-Dateien
#        
#      VERSION: 0.0.5
#      OPTIONS: PAKETLISTE-1.md PAKETLISTE-2.md ....  
#        NOTES: für - live-build - Debian jessie / Debian stretch
#               - es können mehrere PAKETLISTEN kombiniert werden.
#
#       AUTHOR: Gerd Göhler, gerdg-dd@gmx.de
#               Marcel Partap, mpartap@gmx.net
#      CREATED: 2016-08-22
#     REVISION: 2018-08-14
#       Lizenz: CC BY-NC-SA 3.0 DE - https://creativecommons.org/licenses/by-nc-sa/3.0/de/#
#               https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode
#==========================================
. "$(dirname "${0}")/functions.sh"
ROOT=$(repo_root)
TARGET_PATH=${ROOT}/system-config/package-lists

DATUM=$(date +%Y-%m-%d)

convert_markdown_list() {

    MARKDOWN_LIST=$1
    
    if [[ ! -f ${MARKDOWN_LIST} ]]; then
        echo " ${MARKDOWN_LIST} existiert nicht "
        exit 1
    fi
    
    echo " ${MARKDOWN_LIST} wird eingelesen"
    while read line 
    do 
        # remove -- Beschreibung suffix
        line=${line%%"  -"*}
        STATE=${line%%"  "*}
        ENTRY=${line##*"  "}
    
        case "${STATE}" in
            "##")
                # replace all spaces with underscore
                TARGET_LIST_CHROOT=${TARGET_PATH}/${ENTRY// /_}.list.chroot
                TARGET_LIST_BIN=${TARGET_PATH}/${ENTRY// /_}.list.binary
                grep "${DATUM}" ${TARGET_LIST_CHROOT} || echo "#  Package list auto-generated by md2packagelist - ${DATUM}" >> ${TARGET_LIST_CHROOT}

                echo "aktuelle Paketliste: ${TARGET_LIST_CHROOT}"
            ;;
            "- ###")
                echo "### ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- ### :o:")
                echo "### ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- ### :x:")
                MARKDOWN_LIST_INCLUDED="$(dirname "${MARKDOWN_LIST}")/${ENTRY}.md"
                echo " ${MARKDOWN_LIST_INCLUDED} wird eingefügt "
                convert_markdown_list "${MARKDOWN_LIST_INCLUDED}"
                echo " ${MARKDOWN_LIST_INCLUDED} wurde eingefügt "
            ;;
            "- :x:")
                echo ${ENTRY} >> ${TARGET_LIST_CHROOT}
            ;;
            "- :+1:")
                echo "# ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- :+1: :x:")
                echo "## ${ENTRY} wird alternativ mittels extra--installation über packages.chroot installiert" >> ${TARGET_LIST_CHROOT}
                URL=$(echo ${line}|sed -rn 's/.*\((.*)\).*/\1/p')
                echo "## --extra--installation -->  ${URL}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- :o:")
                echo "## ${ENTRY}" >> ${TARGET_LIST_CHROOT}
            ;;
            "- [x]")
                # Kommentarzeilen mit beginnent mit "#" in *.list.binary benötigen patch in 
                # --> /usr/lib/live/build/binary_packages-list    -- Zeile 101 -- fehlt         " | grep -v '^#' >> "
                #
                #101                    Expand_packagelist "${LIST}" "config/package-lists" | grep -v '^#' >> chroot/root/"$(basename ${LIST})"
                #
        #       if [[ ! -f ${TARGET_LIST_BIN} ]]; then 
        #               echo "##  Paketliste erstellt - ${DATUM}" > ${TARGET_LIST_BIN}
        #               echo "" >> ${TARGET_LIST_BIN}
        #       fi
                echo ${ENTRY} >> ${TARGET_LIST_BIN}
                echo "Paketliste -- ${TARGET_LIST_BIN} -- wurde angelegt "
            ;;
        #    "- [ ]")
        #       if [[ ! -f ${TARGET_LIST_BIN} ]]; then 
        #               echo "##  Paketliste erstellt - ${DATUM}" > ${TARGET_LIST_BIN}
        #               echo "" >> ${TARGET_LIST_BIN}
        #       fi
        #       echo "# ${ENTRY}" >> ${TARGET_LIST_BIN}
        #    ;;
            *)
        #       echo " Unbekannt "
            ;;  
        esac

    done < ${MARKDOWN_LIST}
    echo " ${MARKDOWN_LIST} abgearbeitet."
}


mkdir -pv ${TARGET_PATH}

for LIST in $@
do
    convert_markdown_list ${LIST}
done



