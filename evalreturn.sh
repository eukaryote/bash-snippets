#!/usr/bin/env bash

set -o pipefail

template1='${foo}-${bar}'

render_success() {
    local -r foo=${1:?foo param is required}
    local -r bar=${2:?bar param is required}
    local rc
    eval "echo \"${template1}\""
    rc=$?
    return "${rc}"
}

render_fail() {
    local rc
    eval "echox \"${template1}\""
    rc=$?
    return "${rc}"
}

render_template() {
    local template=${1:?template param is required}
    eval "echo \"${template}\""
}

render_success myfoo mybar
echo "render_success: $?"
echo


render_fail myfoo mybar
echo "render_fail: $?"
echo

f() {
    local -r foo=genfoo bar=genbar
    render_template "${template1}"
}

f
