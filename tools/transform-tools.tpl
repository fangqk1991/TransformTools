#!/bin/bash

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
exit