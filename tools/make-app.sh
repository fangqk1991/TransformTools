#!/bin/bash

__FILE__="$0"
REAL_FILE=`readlink "${__FILE__}"`
if [ ! -z "${REAL_FILE}" ]; then
    __FILE__="${REAL_FILE}"
fi

__DIR__=`cd "$(dirname "${__FILE__}")"; pwd`

buildDir=`cd "${__DIR__}/../build"; pwd`

IFS='
'

files=`find "${__DIR__}/../modules" -name "*.sh"`

for file in ${files}; do

    filename=`basename "${file%.*}"`

    # For Apple Script
    # echo do shell script \""${file}"\" > "${__DIR__}/build/${filename}.applescript"

    # For Mac App
    DIR="${buildDir}/${filename}.app/Contents/MacOS"
    mkdir -p "$DIR"

    targetFile="${DIR}/${filename}"

    sed '/^$/d' "${file}" \
    | sed '{
        1s/echo "$1"/pbpaste/
        1i\#!/bin/bash
        $s/^\(.*\)$/\1 | pbcopy/
    }'> "${targetFile}"

    chmod +x "${targetFile}"

    echo "${buildDir}/${filename}.app"
done

php "${__DIR__}/generate.php"

file="${buildDir}/transform-tools.sh"
filename=`basename "${file%.*}"`

DIR="${buildDir}/${filename}.app/Contents/MacOS"
targetFile="${DIR}/${filename}"
mkdir -p "${DIR}"
cp "${__DIR__}/app-delegate.tpl" "${targetFile}"
chmod +x "${targetFile}"
mv "${file}" "${DIR}/main.sh"
echo "${buildDir}/${filename}.app"


