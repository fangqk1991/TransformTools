#!/bin/bash

pbpaste \
| sed -e 's/'\''\([a-zA-z0-9]*\)'\''\ *=>\ *'\''\([a-zA-z0-9]*\)'\''/@"\1": @"\2"/g' \
| pbcopy

pbpaste