#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

sudo ./root_steps.sh

for TARGET_USER in ram exp
do
  groups "$TARGET_USER" &>/dev/null ||
    sudo adduser "$TARGET_USER"

  sudo -u "$TARGET_USER" ./user_steps.sh

  if [ -x "./user_specific_$TARGET_USER.sh" ]
  then
    sudo -u "$TARGET_USER" "./user_specific_$TARGET_USER.sh"
  fi
done

