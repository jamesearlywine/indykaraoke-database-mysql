#!/usr/bin/env bash
MYSQL_PORT="3306"
MYSQL_READY_STRING="port: ${MYSQL_PORT}  MySQL Community Server"

# install nodejs dependencies (db-migrate, etc)
npm install

# start the mysql server
docker-compose up -d

# wait for mysql to become available
echo "Waiting for MySQL to become available for connections.."
docker-compose logs > docker-compose.log
while ! grep -m2 "${MYSQL_READY_STRING}" < docker-compose.log; do
  sleep 1
  printf "."
  docker-compose logs > docker-compose.log
done

# after the mysql server is started, run database seeds and migrations
printf "\n\n"
source ./dbinit.sh
