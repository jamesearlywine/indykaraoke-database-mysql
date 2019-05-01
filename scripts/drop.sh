#!/bin/bash

[[ -z $1 ]] && HOST="127.0.0.1" || HOST=$1
[[ -z $2 ]] && USER="localdev" || USER=$2
[[ -z $3 ]] && PASSWORD="localdev" || PASSWORD=$3
[[ -z $4 ]] && DATABASE="indykaraoke_localdev" || DATABASE=$4

OPTIONS="--host=${HOST} --user=${USER} --password=${PASSWORD} ${DATABASE}"

# echo "OPTIONS: ${OPTIONS}"

echo "DROP DATABASE ${DATABASE}" | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
