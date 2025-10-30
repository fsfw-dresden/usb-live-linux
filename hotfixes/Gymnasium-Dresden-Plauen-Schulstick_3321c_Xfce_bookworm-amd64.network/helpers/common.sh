# Helper file with shared boilerplate code for install hooks

CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
VIOLET=$(tput setaf 5)
BOLD=$(tput bold)
OFF=$(tput sgr0)

color_wrap() (
  OUTPUT=$(eval ${@} 2>&1)
  STATUS=$?
  [ ${STATUS} -eq 0 ] && echo "${GREEN}${OUTPUT}${OFF}" \
    || echo "${RED}${OUTPUT}${OFF}"
  exit ${STATUS}
)

cleanup() {
  echo "${VIOLET}"
  LANG=C sync ${MNT_DIR}/ \
    && color_wrap "umount -v ${MNT_DIR} || umount -v ${MNT_DIR} && rmdir -v ${MNT_DIR}" \
    && echo "${GREEN}${BOLD}${0##*/} completed${OFF}" \
    || {
      echo "${RED}$(fuser --mount --verbose ${MNT_DIR} 2>&1)${OFF}"
      echo "${RED}${BOLD}ERROR in ${0##*/}${OFF}"
      exit 9
    }
  echo
}

die() { printf "\n${RED}${BOLD}${1}${OFF}\n\n" && exit $2; }

id_str_device() {
  DEVICE=${1}
  SERIAL=$(udevadm info --query=property --value --property=ID_SERIAL ${DEVICE} | cut -c1-48 | sed 's/-[0-9]\+:[0-9]\+$//')
[ -n "${SERIAL}" ] && echo ${SERIAL} || echo ${DEVICE} | sed 's|/||;s|/|-|g'
}

engage_device() {
  DEVICE=${1}
  PART_NUM=${2}
  NAME=${3}
# echo "${VIOLET}engage_device(DEVICE=${DEVICE}, PART_NUM=${PART_NUM}, NAME=${NAME})${OFF}"

  [[ "${DEVICE}" =~ "/dev/loop" ]] && p="p" || p=""
  PARTITION=${DEVICE}${p}${PART_NUM}
  MNT_DIR=$(mktemp --tmpdir --directory hotfix.${NAME}.XXXX)

  color_wrap "mount -v ${PARTITION} ${MNT_DIR}" \
    && trap cleanup 0 1 2 3 6 15
}

eval_cmd() {
  CMD="${@}"
  echo "${CYAN}Running '${CMD}'${VIOLET}"
  eval ${CMD}
  echo ${OFF}
}
