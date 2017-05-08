#!/usr/bin/env bash

set -o pipefail

# A bare return without an arg uses the last status code,
# which allows for '... || return' to just fail fast
# and expose error status to the caller.

err() {
    local rc=$?            # capture last command's status
    >&2 echo "ERR: " "$@"  # log error message
    return $rc             # return original status
}


f() {
    false || return
}

g() {
    false
    err "error in g"
}


f
echo "f return value: $?"  # status 1

g
echo "g return value: $?"  # status 1
