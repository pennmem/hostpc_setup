#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

./xconf_settings.py

grep -q .bash_aliases ~/.bashrc || echo -e "if [ -e \"\$HOME/.bash_aliases\" ]\nthen\n  . \"\$HOME/.bash_aliases\"\nfi" >>~/.bashrc
cp files/aliases ~/.bash_aliases

mkdir -p ~/.vim/swap
chmod 700 ~/.vim/swap
if [ ! -e ~/.vimrc ]
then
  cp files/initial_user_vimrc ~/.vimrc
fi

