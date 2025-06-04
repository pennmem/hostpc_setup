#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR" &&

sudo apt update -y &&
sudo apt upgrade -y &&

if [ "$(which git)" == "" ]
then
  sudo apt install -y git
fi &&

git pull &&

./main_steps.sh

