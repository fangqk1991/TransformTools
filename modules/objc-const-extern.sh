echo "$1" | sed '{
    s/\(NSString\ *\*\ *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/
    s/\(int *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/
}'