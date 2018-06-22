#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

{{$hints}}

read -p "Please choose number: " index

case "${index}" in
{{$cases}}
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

{{$functions}}

content=$(pbpaste)

echo '########## Result ##########'

"${func}" "${content}"

echo '########### EOF ##########'
echo 'The result has copied to clipboard!'
read -n1 -p 'Press any key to continue...'
