#!/usr/bin/env bash

# ${var-word}    # if var is defined, use var; otherwise, "word"
# ${var+word}    # if var is defined, use "word"; otherwise, nothing
# ${var=word}    # if var is defined, use var; otherwise, use "word" AND assign "word" to var
# ${var?error}   # if var is defined, use var; otherwise print "error" and exit
#
# ${var:-word}   # if var is defined AND NOT EMPTY, use var; otherwise, "word"; similarly for ${var:+word}, etc.

main() {
    unset UNDEFINED
    local EMPTY=""
    local NONEMPTY="nonempty"

    # supported in original Bourne shell, as well as POSIX shells
    echo "\${VAR-default} uses 'default' only if VAR is not defined:"
    echo "\${UNDEFINED-default}: ${UNDEFINED-default}"
    echo "\${UNDEFINED-xxx}: ${UNDEFINED-xxx}"
    echo "\${EMPTY-default}: ${EMPTY-default}"
    echo "\${EMPTY-xxx}: ${EMPTY-xxx}"
    echo "\${NONEMPTY-default}: ${NONEMPTY-default}"
    echo "\${NONEMPTY-xxx}: ${NONEMPTY-xxx}"
    echo

    # supported in POSIX shells
    echo "\${VAR:-default} uses 'default' if VAR is empty or not defined:"
    echo "\${UNDEFINED:-default}: ${UNDEFINED:-default}"
    echo "\${UNDEFINED:-xxx}: ${UNDEFINED:-xxx}"
    echo "\${EMPTY:-default}: ${EMPTY:-default}"
    echo "\${EMPTY:-xxx}: ${EMPTY:-xxx}"
    echo "\${NONEMPTY:-default}: ${NONEMPTY:-default}"
    echo "\${NONEMPTY:-xxx}: ${NONEMPTY:-xxx}"
    echo

    # supported in original Bourne shell, as well as POSIX shells
    echo "\${VAR=default} uses 'default' only if VAR is not defined (and assigns default to VAR):"
    echo "\${UNDEFINED=default}: ${UNDEFINED=default}"
    echo "\${UNDEFINED=xxx}: ${UNDEFINED=xxx}"
    echo "\${EMPTY=default}: ${EMPTY=default}"
    echo "\${EMPTY=xxx}: ${EMPTY=xxx}"
    echo "\${NONEMPTY=default}: ${NONEMPTY=default}"
    echo "\${NONEMPTY=xxx}: ${NONEMPTY=xxx}"
    echo

    # supported in POSIX shells
    echo "\${VAR:=default} uses 'default' if VAR is empty or not defined (and assigns default to VAR):"
    echo "\${UNDEFINED:=default}: ${UNDEFINED:=default}"
    echo "\${UNDEFINED:=xxx}: ${UNDEFINED:=xxx}"
    echo "\${EMPTY:=default}: ${EMPTY:=default}"
    echo "\${EMPTY:=xxx}: ${EMPTY:=xxx}"
    echo "\${NONEMPTY:=default}: ${NONEMPTY:=default}"
    echo "\${NONEMPTY:=xxx}: ${NONEMPTY:=xxx}"
    echo

    # supported in original Bourne shell, as well as POSIX shells
    echo "\${VAR+word} uses 'word' if VAR is defined, else nothing:"
    echo "\${UNDEFINED+word}: ${UNDEFINED+word}"
    echo "\${UNDEFINED+xxx}: ${UNDEFINED+xxx}"
    echo "\${EMPTY+word}: ${EMPTY+word}"
    echo "\${EMPTY+xxx}: ${EMPTY+xxx}"
    echo "\${NONEMPTY+default}: ${NONEMPTY+default}"
    echo "\${NONEMPTY+xxx}: ${NONEMPTY+xxx}"
    echo

    # supported in POSIX shells
    echo "\${VAR:+word} uses 'word' if VAR is defined and not empty, else nothing:"
    echo "\${UNDEFINED:+word}: ${UNDEFINED:+word}"
    echo "\${UNDEFINED:+xxx}: ${UNDEFINED:+xxx}"
    echo "\${EMPTY:+word}: ${EMPTY:+word}"
    echo "\${EMPTY:+xxx}: ${EMPTY:+xxx}"
    echo "\${NONEMPTY:+default}: ${NONEMPTY:+default}"
    echo "\${NONEMPTY:+xxx}: ${NONEMPTY:+xxx}"
    echo
}

main
