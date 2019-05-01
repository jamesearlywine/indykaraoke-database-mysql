#!/bin/bash

[[ -z $1 ]] && HOST="127.0.0.1" || HOST=$1
[[ -z $2 ]] && USER="localdev" || USER=$2
[[ -z $3 ]] && PASSWORD="localdev" || PASSWORD=$3
[[ -z $4 ]] && DATABASE="indykaraoke_localdev" || DATABASE=$4

OPTIONS_NO_DATABASE="--host=${HOST} --user=${USER} --password=${PASSWORD}"
OPTIONS="--host=${HOST} --user=${USER} --password=${PASSWORD} ${DATABASE}"

# echo "OPTIONS: ${OPTIONS}"

echo "Creating database: ${DATABASE}"
echo "CREATE DATABASE ${DATABASE}" | mysql ${OPTIONS_NO_DATABASE} 2>&1 | grep -v "Warning: Using a password"

echo "Seeding database: ${DATABASE}  -- with tables from ./seed_create"
cat ./seed_create/000100_indykaraoke_cache.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000200_indykaraoke_karaoke_event_recurrences.sql  | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000300_indykaraoke_weekly_karaoke_events.sql  | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000400_indykaraoke_venues.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000500_indykaraoke_users.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000600_indykaraoke_recurrence_types.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_create/000700_indykaraoke_password_resets.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
