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

    sed '{
        /fc_input start/i\fc_input="$(pbpaste)"
        /fc_input start/,/fc_input end/d
        /fc_output start/i\echo "\${fc_output}" | pbcopy
        /fc_output start/,/fc_output end/d
    }' "${file}" > "${targetFile}"

    chmod +x "${targetFile}"

    echo "${buildDir}/${filename}.app"
done

filename='transform-tools'
DIR="${buildDir}/${filename}.app/Contents/MacOS"
mainFile="${DIR}/main.sh"
targetFile="${DIR}/${filename}"

mkdir -p "${DIR}"

for file in ${files}; do
    filename=`basename "${file%.*}"`
    cp "${file}" "${DIR}/${filename}"
    chmod +x "${DIR}/${filename}"
done

php "${__DIR__}/generate.php" > "${mainFile}"
cp "${__DIR__}/app-delegate.tpl" "${targetFile}"
chmod +x "${targetFile}" "${mainFile}"
echo "${buildDir}/${filename}.app"


