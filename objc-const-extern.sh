#!/bin/bash

pbpaste \
| sed -e 's/\(NSString\ *\*\ *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/g' \
    -e 's/\(int *const *[a-zA-z0-9]*\)\ *=\ *.*;/extern \1;/g' \
| pbcopy

pbpaste