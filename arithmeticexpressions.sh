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
