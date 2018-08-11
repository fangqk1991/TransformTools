#!/bin/bash

PATH="/usr/local/bin:$PATH"

###### fc_input start ######
fc_input="$1"
###### fc_input end ######

fc_output="$(echo "${fc_input}" | sed '{
    s/\(NSString\ *\*\ *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/
    s/\(int *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/
}')"

###### fc_output start ######
echo "${fc_output}"
###### fc_output end ######
