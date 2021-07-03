#!/bin/sh

. ./user.sh

LOCAL_UID=${USER_ID} LOCAL_GID=${GROUP_ID} docker compose -f docker-compose.yml -f docker-compose-test.yml $*
