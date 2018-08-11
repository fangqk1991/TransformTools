#!/bin/bash

PATH="/usr/local/bin:$PATH"

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    /^[[:space:]]*$/d
}' | sed -n '{
    /^[[:space:]]*[+-][[:space:]]*([^{]*/{
        N
        :rep
        /^[^{]*$/{
            N
            t rep
        }
        s/\n/ /g
        s/[[:space:]][[:space:]]*/ /g
        s/^[[:space:]]*\(.*\){.*$/\1;/
        s/[[:space:]]*;/;/
        p
    }
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
