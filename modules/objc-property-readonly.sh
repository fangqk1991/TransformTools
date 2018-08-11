#!/bin/bash

PATH="/usr/local/bin:$PATH"

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed -n '{
    /readwrite/p
}' | sed '{
    s/readwrite/readonly/
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
