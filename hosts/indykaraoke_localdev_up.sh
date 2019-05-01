#!/bin/bash
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_DIRECTORY}/_hosts.admin.sh"
addHost 127.0.0.1 database-localdev.indykaraoke.com
