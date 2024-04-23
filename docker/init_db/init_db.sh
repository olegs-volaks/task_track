#!/bin/bash

set -e

dump_file="/dump/sql_dump.sql"

psql --username "$POSTGRES_USER" -c "CREATE DATABASE $RAILS_TEST_DATABASE;"

#psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < "$dump_file"

