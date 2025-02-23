#!/usr/bin/env sh

docker compose pull
docker compose --env-file .env --project-name botificator up -d

docker system prune -f
