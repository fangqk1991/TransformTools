#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

# moduleName='sql-rows-to-php-array'
moduleName='futu-to-python-mapper'
script="${__DIR__}/../modules/${moduleName}.sh"

content=$(pbpaste)
"${script}" "${content}"