echo "$1" | sed -n '{
    /^[[:space:]]*[a-z][a-z0-9_]*[[:space:]][[:space:]]*\(INT\|CHAR\|VARCHAR\|DATE\).*$/p
}' \
| sed '{
    s/^[[:space:]]*\([a-zA-Z0-9_]*\).*$/'\''\1'\'',/
}'