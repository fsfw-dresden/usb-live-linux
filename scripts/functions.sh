#!/bin/sh

# die on error
set -e

COLOR_GREEN="\e[1;32m"
COLOR_YELLOW="\e[1;33m"
COLOR_CYAN="\e[1;36m"
COLOR_RED="\e[1;31m"
COLOR_OFF="\e[0m"

repo_root() {
    git rev-parse --show-toplevel
}

cd_repo_root() {
    # echo "current dir: " $(pwd)
    cd $(dirname $(realpath "${0}"))
    ROOT=$(repo_root)
    # echo "setting working directory to repo root at ${ROOT}"
    cd "${ROOT}"
}

is_root_user_or_die() {
    [ "$(id -u)" = "0" ] || die "ERROR: no super-user privilege, please run as root or with sudo."
}

check_bootstrap_cache_version() {
    VERSION=$1
    CODENAME=$2

    PATH_BOOTSTRAP_CACHE=../build/cache/bootstrap
    PATH_DEB_VERSION=/etc/debian_version

    # no problem if no bootstrap cache yet
    [ -d ${PATH_BOOTSTRAP_CACHE} ] || return 0

    # debian_version of bootstrap cache not matching?
    grep -qs ^${VERSION} ${PATH_BOOTSTRAP_CACHE}${PATH_DEB_VERSION} || {
        print_info "Found cached bootstrap stage ($(cat ${PATH_BOOTSTRAP_CACHE}${PATH_DEB_VERSION})) not matching selected build variant (${VERSION}: ${CODENAME})."
        print_info "Moving build/cache/bootstrap folder out of the way so it will be regenerated."
        DATESTR=$(date --date="$(stat --printf='%y' ${PATH_BOOTSTRAP_CACHE})" +'%F.%H%Mh')
        mv -v ${PATH_BOOTSTRAP_CACHE} ${PATH_BOOTSTRAP_CACHE}.${DATESTR}
    }
}

check_program_exists() {
    [ ! -z $(command -v "${@}") ] && return 0
    echo "Program '${@}' does NOT exist in path, please install the corresponding package!"
    return 1
}

print_info() {
    printf "[ ℹ️  ] ${COLOR_CYAN}${*}${COLOR_OFF}\n" >&2
}

print_warn() {
    printf "[ ⚠️  ] ${COLOR_YELLOW}${*}${COLOR_OFF}\n" >&2
}

print_success() {
    printf "[ ✅ ] ${COLOR_GREEN}${*}${COLOR_OFF}\n" >&2
}

print_error() {
    printf "[ 🛑 ] ${COLOR_RED}${*}${COLOR_OFF}\n" >&2
}

die() {
    print_error "${@}"
    # If this was invoked from a shell (i.e. parent process
    # looks like a shell process as its cmdline matches
    # '[non-whitespacee]*sh[word boundary]'), just exit.
    # Otherwise (script started from desktop shortcut f.e.),
    # show confirmation prompt before quitting & closing.
    grep -qs '\S*sh\b' /proc/${PPID}/cmdline || read -p "Press ENTER to exit."
    exit 1
}

# THANKS https://unix.stackexchange.com/questions/364776/how-to-output-a-date-time-as-20-minutes-ago-or-9-days-ago-etc
rel_fmt_low_precision() {
    local SEC_PER_MINUTE=$((60))
    local   SEC_PER_HOUR=$((60*60))
    local    SEC_PER_DAY=$((60*60*24))
    local  SEC_PER_MONTH=$((60*60*24*30))
    local   SEC_PER_YEAR=$((60*60*24*365))

    local last_unix="$(date --date="$1" +%s)"    # convert date to unix timestamp
    local now_unix="$(date +'%s')"

    local delta_s=$(( now_unix - last_unix ))

    if (( delta_s <  SEC_PER_MINUTE * 2))
    then
        echo ""$((delta_s))" seconds ago"
        return
    elif (( delta_s <  SEC_PER_HOUR * 2))
    then
        echo ""$((delta_s / SEC_PER_MINUTE))" minutes ago"
        return
    elif (( delta_s <  SEC_PER_DAY * 2))
    then
        echo ""$((delta_s / SEC_PER_HOUR))" hours ago"
        return
    elif (( delta_s <  SEC_PER_MONTH * 2))
    then
        echo ""$((delta_s / SEC_PER_DAY))" days ago"
        return
    elif (( delta_s <  SEC_PER_YEAR * 2))
    then
        echo ""$((delta_s / SEC_PER_MONTH))" months ago"
        return
    else
        echo ""$((delta_s / SEC_PER_YEAR))" years ago"
        return
    fi
}
