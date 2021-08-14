#!/bin/bash -u

BASE=$(dirname "$(readlink -f "$0")")
source "${BASE}/lib/includes"

if [ ! -f "${BASE}/.env" ];then
  echo "no .env file specified in ${BASE}, exiting..."
  exit 1
fi

source "${BASE}/.env"

# required variables
: "$PUSHOVER_TOKEN"
: "$PUSHOVER_USER"


curl -s \
  --form-string "token=${PUSHOVER_TOKEN}" \
  --form-string "user=${PUSHOVER_USER}" \
  --form-string "title=Klipper on $(hostname)" \
  --form-string "url=http://$(hostname -A)" \
  --form-string "sound=falling" \
  --form-string "message=${*}" \
  https://api.pushover.net/1/messages.json
