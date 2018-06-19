#!/bin/bash

pbpaste \
| grep "readwrite" \
| sed -e 's/readwrite/readonly/g' \
| pbcopy

pbpaste