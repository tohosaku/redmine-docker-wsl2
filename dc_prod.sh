#!/bin/sh

. ./user.sh

docker compose -f docker-compose.yml -f docker-compose-prod.yml $*
