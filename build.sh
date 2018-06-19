#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

IFS='
'

files=`find "${__DIR__}" -name "*.sh" ! -path "${__DIR__}/build.sh"`

for file in ${files}; do
    filename=`basename "${file%.*}"`
    echo do shell script \""${file}"\" > "${__DIR__}/build/${filename}.applescript"
done