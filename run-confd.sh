#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [[ ! -e /confd-has-run ]]; then
  confd -onetime -backend env
  touch /confd-has-run
fi

exec /entrypoint.sh "$@"
