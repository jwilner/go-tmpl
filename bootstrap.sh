#!/usr/bin/env bash

readonly CUR_PATH="github.com/jwilner/go-tmpl"

main() {
    if [[ -z "${1}" ]]; then
        cat <<EOF >&2
USAGE: bootstrap.sh PACKAGE_PATH" >&2

PACKAGE_PATH is the path as used for go modules; e.g. github.com/jwilner/go-tmpl
EOF
        exit 1
    fi

    LC_ALL=C find . -path ./.git -prune -false -o -type f -exec sed -i.bak 's!'"${CUR_PATH}"'!'"${1}"'!g' {} \;
    find . -path ./.git -prune -false -o -type f -name '*.bak' -delete

    rm bootstrap.sh
}

main "${@}"
