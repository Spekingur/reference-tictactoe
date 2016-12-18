#!/bin/bash

set -e                              # stops on any error

sleep 10                            # delay for 10 seconds
case "$1" in
  "production")                     # input is runserver.sh production
    npm run migratedb -- -e prod    # run database migration against production database
    ;;
  "")                               # input is runserver.sh
    npm run migratedb               # run database migration against dev database
    ;;
esac

node run.js                         # start up

exit 0
