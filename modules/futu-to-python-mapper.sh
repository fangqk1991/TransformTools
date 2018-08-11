#!/bin/bash

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    s/^\([a-zA-z0-9]*\).*$/'\''\1'\'': '\''\1'\'',/g
}' | sed '{
    :start
    s/[_]\([a-z]\)\([a-zA-z0-9]*'\'':\)/\u\1\2/
    t start
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
