#!/usr/bin/env bash

set -x

# We don't need to quote right side of variable
# assignment when it is a variable:
foo=${foo:-a b}

[[ $foo = 'a b' ]]
echo $?  # 0: equal

foo='a b c'
bar=${foo}
[[ $bar = 'a b c' ]]
echo $?  # 0: equal

f() {
    cat <<EOF
a
b
c
EOF
}

# We also don't need to quote the right
# side if it's a command substitution:
foo="$(f)"
[[ "$(echo "${foo}" | wc -l)" = 3 ]]
echo $?  # 0: line breaks handled correctly

foo=$(f)
[[ "$(echo "${foo}" | wc -l)" = 3 ]]
echo $?  # 0: line breaks handled correctly
