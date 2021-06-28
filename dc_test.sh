#!/bin/sh

USER_ID=`id | sed -e 's/^uid=\(.*\)(\(.*\)) gid=.*$/\1/'`
GROUP_ID=`id | sed -e 's/uid=.* gid=\(.*\)(\(.*\)) groups=.*/\1/'`

LOCAL_UID=${USER_ID} LOCAL_GID=${GROUP_ID} docker compose -f docker-compose.yml -f docker-compose-test.yml $*
