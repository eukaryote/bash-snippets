#!/usr/bin/env bash

set -e

# The set -e above is ignored when the function
# below is invoked in a context that ignores
# 'set -e', such as '||', or 'while', 'until',
# 'if', 'elif'.
#
# With pipelines, the status of the pipeline
# as a whole is what determines whether exit
# occurs when executed in a context that
# does not ignore errexit.
#
# This is a backwards-compatibility wart with a
# a decision that was made 30 years ago.
#
# Even doing 'set -e' inside the function has
# no effect, because the errexit option cannot
# be enabled when in a context that ignores errexit.
f() {
    echo $-  # aka $SHELLOPTS
    false
    echo "AFTER ERROR"
}

# 'AFTER ERROR' is not reached if '||'
# not used below, and it is reached if
# '||' is used below.
#
# In the latter case, because the function f
# is invoked in a context that ignores the
# 'set -e', the 'set -e' is ignored for the
# duration of the entire body of f.
#
f || { echo "f failed" >&2; exit 1; }
# Exits with status 0!
