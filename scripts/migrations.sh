#!/bin/bash
echo "Running schema migrations against database: ${DATABASE} -- with migrations from ./migrations"
db-migrate up --config ./database.json -e localdev --migration-table __z_migrations
