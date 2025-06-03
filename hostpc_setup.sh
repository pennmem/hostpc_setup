#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

sudo apt update -y
sudo apt upgrade -y

sudo fwupdmgr update

sudo apt install -y vim-gtk3 xserver-xorg-input-synaptics aptitude git

./xconf_settings.py


