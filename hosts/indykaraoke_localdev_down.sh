#!/bin/bash
SCRIPT_DIRECTORY="${BASH_SOURCE[0]}"
source "${SCRIPT_DIRECTORY}/_hosts.admin.sh"
removeHost database-localdev.indykaraoke.com
