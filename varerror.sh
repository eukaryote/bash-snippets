#!/usr/bin/env bash

set -o pipefail


f() {
    local -r name=${1:?name is required}
    echo "name:${name}"
}

g() {
    local -r dir=$(dirname "$1")
    ls -l "${dir}"
}


f "$@"

g "$@"
