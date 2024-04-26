#!/bin/bash

set -euo pipefail

# Remove all Docker Compose containers and volumes
docker-compose down -v
#
# Build all Docker Compose services
docker-compose build
#

docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails db:test:load_schema

docker-compose down