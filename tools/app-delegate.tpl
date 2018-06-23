#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

open -a Terminal.app "${__DIR__}/main.sh"
