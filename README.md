# Indykaraoke Mysql Database

This repo contains the automation required to spin up an Indykaraoke Mysql Database.

this is useful for:
  - Local development
  - Pipeline automated e2e tests

# Dependencies
- git
- nodejs (tested with version 10.12.0)
- npm (tested with version 6.4.1)

# Spin up local dataase
- `git clone https://github.com/jamesearlywine/indykaraoke-database-mysql`
- `cd indykaraoke-database-mysql`
- `./up.sh`

# Warning
- When a PR is merged to a deployment branch
  - any scripts under /migrations that haven't been run against that environment's hosted database, will run.
  - deployment branches include:
    - **production (!)**
    - staging

# Notes
- Uses a node module called `db-migrate` to create and run schema migrations
  - https://db-migrate.readthedocs.io/en/latest/


# Best Practices
- When making schema changes:
  - write a migration to bring the database into an intermediary state, such that the schema supports the existing and future webservice functionality
  - then update the webservice to use the new functionality (writes, reads, etc)
  - then write a migration to convert all records from the old schema to the new schema
  - then write a schema migration to eliminate the deprecated fields/functionality
  - This site (and book) has many best-practice database refactoring recipes: https://databaserefactoring.com
    - We have this book in pdf form if anyone needs to reference it


# Todo
- Add a quick database backup before running migrations against a non-localdev environment?
  - store in s3?