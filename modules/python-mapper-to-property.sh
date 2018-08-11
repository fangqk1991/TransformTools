#!/bin/bash

PATH="/usr/local/bin:$PATH"

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    s/^[[:space:]]*'\''\([a-zA-z0-9]*\)'\''.*$/\1 = None/g
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
