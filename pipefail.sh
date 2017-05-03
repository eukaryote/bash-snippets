#!/usr/bin/env bash

set -o pipefail

run() {
    set -x
    echo -n baz | grep nomatch | wc -l >/dev/null
    echo -e $? '\n'
    count=$(echo -n baz | grep nomatch | wc -l)
    echo -e $? '\n'
    echo -n 'x' | false | wc -l >/dev/null
    echo -e $? '\n'
    set +x
}

run
