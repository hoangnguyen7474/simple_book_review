#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f ${APP_DIR}/tmp/pids/server.pid

echo
echo "Create database"
bundle exec rake db:create
echo "Database migration"
bundle exec rake db:migrate
echo
bundle exec rails s -b 0.0.0.0 -p $PORT