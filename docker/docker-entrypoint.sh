#!/bin/sh

set -e

if  [ "${1}" = "rails" ] && [ "${2}" = "server" ] && [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec "${@}"