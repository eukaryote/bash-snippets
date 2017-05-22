#!/usr/bin/env bash

# The xtrace (set -x) option prints expanded
# commands to stderr, so can't be used in cases
# where uncontaminated stderr output is needed.

f() {
    date
}

main() {
    local date
    (set -x && echo "date: $(f 2>&1)")
}

main
