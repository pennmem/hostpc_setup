#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

# Copy initial versions of xml files not present by default
cd files/initial_xml &&
for file in *
do
  if [ ! -e ~/.config/xfce4/xfconf/xfce-perchannel-xml/"$file" ]
  then
    cp "$file" ~/.config/xfce4/xfconf/xfce-perchannel-xml/
  fi
done
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
if [ ! -e ~/.selected_editor ]
then
  cp files/selected_editor ~/.selected_editor
fi

mkdir -p ~/bin
cp files/bin/* ~/bin/

