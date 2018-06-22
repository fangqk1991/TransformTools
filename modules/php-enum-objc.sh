echo "$1" | sed '{
    s/const\ *\([a-zA-z0-9]*\ *=\ *.*\);/\1,/
}'