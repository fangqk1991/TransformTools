#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

IFS='
'

files=`find "${__DIR__}" -name "*.sh" ! -path "${__DIR__}/$(basename "$0")"`

for file in ${files}; do

    filename=`basename "${file%.*}"`

    # For Apple Script
    # echo do shell script \""${file}"\" > "${__DIR__}/build/${filename}.applescript"

    # For Mac App
    DIR="${__DIR__}/build/${filename}.app/Contents/MacOS"
    mkdir -p "$DIR"
    cp "${file}" "${DIR}/${filename}"
    chmod +x "${DIR}/${filename}"

    echo "${__DIR__}/build/${filename}.app"
done