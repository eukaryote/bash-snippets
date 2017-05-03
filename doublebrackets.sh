#!/usr/bin/env bash

set -x

# double-quote not needed inside double brackets
# to protect against nonexistent or empty variables:
[[ $foo = $bar ]]
echo $?  # zero

foo=foo

[[ $foo = $bar ]]
echo $?  # non-zero

[[ $bar = $foo ]]
echo $?  # non-zero

# Inside double brackets, neither side of an '='
# undergoes word splitting, but the right side
# (and not the left side) does perform matching,
# so if the right side is a literal that contains
# a special character wrt matching, it must be quoted.
foo='foobazbar'
[[ $foo = foobazbar ]]
echo $?  # 0: matches

[[ $foo = foo*bar ]]
echo $?  # 0: matches

# If we want the right side to be equal
# without pattern matching, we have to quote it:
[[ $foo = "foo*bar" ]]
echo $?  # 1: doesn't match

# We don't need to worry about word splitting
# of variables in either case:
foo='a b c; echo'
bar='a b c'

[[ $foo = $bar ]]
echo $?  # 1: not equal

[[ $foo = $bar ]]
echo $?  # 1: not equal

bar='a b c; echo'
[[ $foo = $bar ]]
echo $?  # 0: equal
