#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`


files=`find "${__DIR__}/../modules" -name "*.sh"`

for file in ${files}; do

    filename=`basename "${file%.*}"`
    datafile="${__DIR__}/${filename}.txt"

    if [ ! -f "${datafile}" ]; then
        echo "${filename} test fail. The test data missing.."
    else
        echo "=== ${filename} ==="
        content="$(cat "${datafile}")"
        echo "====== input ======"
        echo "${content}"
        echo "====== output ======"
        "${file}" "${content}"
        echo "========================"
    fi 
done
