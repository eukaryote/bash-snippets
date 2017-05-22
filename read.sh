#!/usr/bin/env bash

read_and_echo1() {
    local line
    # The -r prevents backslash from being interpreted as an escape character;
    # if no variable is provided, the input is assigned to REPLY.
    # A delimiter character other than '\n' can be used with '-d', but it
    # only uses the first character of the delimiter, so it can't be
    # something like 'EOF'.
    # Using -d '' results in NULL (\0) being used as the delimiter, which
    # can be useful for reading multi-line inputs.
    while read -r
    do
        # without double-quotes around $REPLY, leading and trailing
        # whitespace is stripped
        line=$REPLY
        echo "line: ${line}"
    done
}

read_and_echo2() {
    local line
    while read -r line
    do
        echo "line: ${line}"
    done
}

read_and_echo3() {
    # Assign first word to 'word1' and remaining words in line to 'rest'
    local word1
    local rest
    while IFS=' ' read -r word1 rest
    do
        echo "word1: ${word1}"
        echo "rest: ${rest}"
    done
}

read_with_timeout() {
    # '-t SECONDS' may be used to fail if not done reading before timeout
    echo "reading input..."
    read -r -t 1 || {
        local -r rc=$?
        if (( $rc >= 128 ))
            then
            echo "ERROR[$rc]: TIMEOUT waiting for read input"
        else
            echo "ERROR[$rc]: unexpected error"
        fi
        return $rc
    }
    echo "input: $REPLY"
}

main() {
    echo -e '     line1 arg1a arg1b\n line2 arg2a arg2b\n   line3 arg3a arg3b' | read_and_echo1
    echo
    echo -e '     line1 arg1a arg1b\n line2 arg2a arg2b\n   line3 arg3a arg3b' | read_and_echo2
    echo
    echo -e '     line1 arg1a arg1b\n line2 arg2a arg2b\n   line3 arg3a arg3b' | read_and_echo3
    echo

    echo -e '     line1 arg1a arg1b\n line2 arg2a arg2b\n   line3 arg3a arg3b' | read_with_timeout
    read_with_timeout || true
}

main
