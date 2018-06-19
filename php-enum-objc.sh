#!/bin/bash

pbpaste \
| sed -e 's/const\ *\([a-zA-z0-9]*\ *=\ *.*\);/\1,/g' \
| pbcopy

pbpaste