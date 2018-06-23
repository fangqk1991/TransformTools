echo "$1" | sed '{
    :start
    s/[_-]\([a-z]\)/\u\1/
    t start
}'