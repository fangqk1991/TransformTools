echo "$1" | sed -n '{
    /readwrite/p
}' | sed '{
    s/readwrite/readonly/
}'