#!/bin/bash

set -euo pipefail

service_name="db"

database_name="task_track"
database_user="task_track"


dump_file="./docker/sql_dump.sql"

docker compose exec -T $service_name pg_dump -U $database_user -c --if-exists $database_name > $dump_file

echo "Database dump for $database_name created at $dump_file."
