#!/usr/bin/env bash

# Use ${VAR=default} to use 'default' if VAR is not set, and
# use ${VAR:-default} to use 'default' if VAR is empty or not set.

main() {
    unset UNSET
    local EMPTY=""

    echo "\${VAR=default} uses 'default' only if VAR is not defined:"
    echo "\${EMPTY=default}: ${EMPTY=default}"
    echo "\${UNSET=default}: ${UNSET=default}"
    echo

    echo "\${VAR:-default} uses 'default' if it is empty or not defined:"
    echo "\${EMPTY:-default}: ${EMPTY:-default}"
    echo "\${UNSET:-default}: ${UNSET:-default}"
}

main
