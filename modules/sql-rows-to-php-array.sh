#!/bin/bash

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed -n '{
    /^[[:space:]]*[a-z][a-z0-9_]*[[:space:]][[:space:]]*\(INT\|CHAR\|VARCHAR\|DATE\).*$/p
}' \
| sed '{
    s/^[[:space:]]*\([a-zA-Z0-9_]*\).*$/'\''\1'\'',/
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
