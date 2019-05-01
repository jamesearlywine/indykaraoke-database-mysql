#!/bin/bash
[[ -z $1 ]] && HOST="127.0.0.1" || HOST=$1
[[ -z $2 ]] && USER="localdev" || USER=$2
[[ -z $3 ]] && PASSWORD="localdev" || PASSWORD=$3
[[ -z $4 ]] && DATABASE="indykaraoke_localdev" || DATABASE=$4

OPTIONS="--host=${HOST} --user=${USER} --password=${PASSWORD} ${DATABASE}"

echo "Seeding database: ${DATABASE} -- with test data from ./seed_test_data"
# echo "OPTIONS: ${OPTIONS}"

cat ./seed_test_data/indykaraoke_cache.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_karaoke_event_recurrences.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_weekly_karaoke_events.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_venues.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_users.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_recurrence_types.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
cat ./seed_test_data/indykaraoke_password_resets.sql | mysql ${OPTIONS} 2>&1 | grep -v "Warning: Using a password"
