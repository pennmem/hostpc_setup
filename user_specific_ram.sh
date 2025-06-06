#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

cp files/ram_bin/* ~/bin/

echo "Running elemem automatic tag builder."
$HOME/bin/elemem_tagbuilder

cat <(crontab -l 2>/dev/null | grep -v "AUTOSETUP" || cat files/blank_crontab) files/ram_crontab | crontab -

