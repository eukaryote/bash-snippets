#!/usr/bin/env bash

# A command substitution needs to be quoted
# if it occurs in a context that requires
# quoting in general.

# For example, the right-side of a variable
# assignment needs quoting if it is a literal
# but not if it's a variable or command substitution:
foo=$(cat /proc/cpuinfo)  # works correctly

# But using a command substitution as part
# of another command does require quoting:
dirpath='my test dir xx/subdir'
mkdir -p "${dirpath}"
trap 'rmdir "${dirpath}"; rmdir "$(dirname "${dirpath}")"' EXIT
set -x
ls -l $(dirname "${dirpath}") >/dev/null 2>&1
echo $?  # 2: fail
ls -l "$(dirname "${dirpath}")" >/dev/null 2>&1
echo $?  # 0: success
