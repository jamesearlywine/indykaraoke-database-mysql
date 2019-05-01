#!/usr/bin/env bash

# remove entry in /etc/hosts
source ./hosts/indykaraoke_localdev_down.sh

# shut down stack
docker-compose down
