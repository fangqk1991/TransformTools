#!/bin/bash

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    :start
    s/[_-]\([a-z]\)/\u\1/
    t start
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
