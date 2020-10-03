#!/usr/bin/env bash

readonly CUR_PATH="github.com/jwilner/go-tmpl"
readonly CUR_LICENSOR="Joe Wilner"

main() {
    if [[ -z "${1}" ]] || [[ -z "${2}" ]]; then
        cat <<EOF >&2
USAGE: bootstrap.sh PACKAGE_PATH LICENSOR"

- PACKAGE_PATH is the path as used for go modules; e.g. "${CUR_PATH}".
- LICENSOR is usually the author or owning organization; e.g. "${CUR_LICENSOR}".
EOF
        exit 1
    fi

    LC_ALL=C find . -path ./.git -prune -false -o -type f -exec sed -i.bak '
s!'"${CUR_PATH}"'!'"${1}"'!g;
s!'"${CUR_LICENSOR}"'!'"${2}"'!g' {} \;

    find . -path ./.git -prune -false -o -type f -name '*.bak' -delete

    rm bootstrap.sh
}

main "${@}"
