#!/bin/bash

PATH="/usr/local/bin:$PATH"

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

mapper="$(echo "${fc_input}" | sed '{
    s/^\([a-zA-z0-9]*\).*$/'\''\1'\'': '\''\1'\'',/g
}' | sed '{
    :start
    s/[_]\([a-z]\)\([a-zA-z0-9]*'\'':\)/\u\1\2/
    t start
}')"

properties="$(echo "${mapper}" | sed '{
    s/^[[:space:]]*'\''\([a-zA-z0-9]*\)'\''.*$/\1 = None/g
}')"

fc_output="
${properties}

${mapper}
"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
