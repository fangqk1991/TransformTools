#!/bin/bash

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    s/'\''\([a-zA-z0-9]*\)'\''\ *=>\ *'\''\([a-zA-z0-9]*\)'\''/@"\1": @"\2"/g
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
