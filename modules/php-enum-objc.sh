#!/bin/bash

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    s/const\ *\([a-zA-z0-9]*\ *=\ *.*\);/\1,/
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
