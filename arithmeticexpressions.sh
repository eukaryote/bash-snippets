#!/usr/bin/env bash

answer=42
limit=0121

# arithmetic operations should not be
# performed inside double-brackets, even
# though it works in some cases.
echo "Fail: treated as string comparison:"
if [[ ${answer} < ${limit} ]]
then
    echo "${answer} is less than ${limit}"
else
    echo "${answer} is not less than ${limit}"
fi
echo

echo "Success: treated as integer comparison:"
if (( ${answer} < ${limit} ))
then
    echo "${answer} is less than ${limit}"
else
    echo "${answer} is not less than ${limit}"
fi
echo

# The '$' is not necessary inside an arithemtic expression.
# Variables names are substituted with their values, as long
# as the value is a valid integer. In Bash, the substition
# continues recursively until an integer is generated
# or an invalid variable name is generated.
# Unset or empty variables are evaluated as 0.
one() {
    echo -n 1
}
if ((one < 2))
then
    echo "\$(one) < 2: YES"
else
    echo "\$(one) < 2: NO"
fi
echo

echo "zero is undefined"
((zero < 1))
echo $?  # works, as 'zero' treated as 0
echo

# A '$' before the arithmetic expression parentheses is
# not required in compound commands, which are the shell
# programming constructs that begin with a reserved
# word or control operator and end with a corresponding
# reserved word or operator ('for', 'if', etc.).

# Not required:
for ((x=0; x<3;++x))
do
    echo $x
done
echo

# Required:
echo $((1 + 2))
