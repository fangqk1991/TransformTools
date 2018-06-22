#!/bin/bash

pbpaste \
| sed '{
    /^[[:space:]]*$/d
}' \
| sed -n '{
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
}' \
| pbcopy

pbpaste