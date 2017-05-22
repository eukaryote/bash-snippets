#!/usr/bin/env bash

# Use + parameter expansion to distinguish between
# an unset variable and an empty variable.

main() {
    local NONEMPTY="nonemptyvar"
    local EMPTY=""
    unset UNSET

    if [[ "${NONEMPTY+defined}" ]]
    then
        echo "NONEMPTY is defined and has value '${NONEMPTY}'"
    else
        echo "NONEMPTY is not defined"
    fi

    if [[ "${UNSET+defined}" ]]
    then
        echo "UNSET is defined and has value '${UNSET}'"
    else
        echo "UNSET is not defined"
    fi
    if [[ "${EMPTY+defined}" ]]
    then
        echo "EMPTY is defined and has value '${EMPTY}'"
    else
        echo "EMPTY is not defined"
    fi
}

main
