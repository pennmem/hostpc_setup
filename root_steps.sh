#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

fwupdmgr -y --no-reboot-check update

apt install -y vim-gtk3 xserver-xorg-input-synaptics aptitude git cmake curl apt-file autoconf automake rustc cargo cheese clang clisp dos2unix doxygen eog libreoffice wine lftp gfortran ghc galculator gimp-data-extras golang-go gsfonts gv hexedit idle inotify-tools net-tools ispell kdenlive latex2rtf latexdraw llvm lyx w3m maxima wxmaxima mercurial mplayer vlc smplayer mpv mtools mypy neovim nmap nodejs oathtool obs-studio obs-plugins octave okular openssh-server openssh-sftp-server p7zip pandoc pdf2svg php ps2eps psutils pybind11-dev fftw-dev fftw2 libfftw3-bin libfftw3-dev python3-numpy python3-scipy python3-matplotlib python3-seaborn python3-setuptools python3-sympy python3-toml python3-sklearn qemu-system-x86 qtbase5-dev qtcreator rename radeontop retext gitk samba screen scribus spell sshfs subversion unrar webp whois wmctrl xsel rubber libqt5svg5 libqt5svg5-dev libblas3 libblas-dev libblas64-3 libblas64-dev liblapack3 liblapack-dev liblapack64-3 liblapack64-dev ||
echo " *** WARNING!  APT PACKAGE INSTALLATION FAILED! *** "

# While 24.04 is still on cups-browsed 2.0.0, pull the next version to bypass
# 200% cpu bug
# https://bugs.launchpad.net/ubuntu/+source/cups-browsed/+bug/2067918
if [ "$(dpkg -l cups-browsed | grep 2.0.0)" != "" ]
then
  cd /tmp
  wget http://us.archive.ubuntu.com/ubuntu/pool/main/c/cups-browsed/cups-browsed_2.0.1-0ubuntu2.2_amd64.deb &&
  apt install ./cups-browsed_2.0.1-0ubuntu2.2_amd64.deb &&
  systemctl stop cups-browsed &&
  systemctl stop cups &&
  systemctl start cups &&
  systemctl start cups-browsed
  cd "$SCRIPTDIR"
fi

snap install chromium signal-desktop telegram-desktop typst
snap refresh

# Install runvenv
cd /usr/local/src &&
if [ -e runvenv ]
then
  cd runvenv &&
  git pull
else
  git clone https://github.com/rcolyer/runvenv.git &&
  cd runvenv
fi &&
make &&
cp -d runvenv runipyth runpip /usr/bin/
cd "$SCRIPTDIR"

# Install miniforge3 if missing
cd /usr/local/share &&
if [ ! -e miniforge3 ]
then
  FILE="Miniforge3-$(uname)-$(uname -m).sh" &&
  wget "https://github.com/conda-forge/miniforge/releases/latest/download/$FILE" &&
  HOME="/usr/local/share" bash "$FILE" -b
  rm -f "$FILE"
else
  # If miniforge needs updated on deployments later, put instructions here.
  true # Do nothing for now
fi
cd "$SCRIPTDIR"

# Setup system space for Elemem
mkdir -p /usr/local/share/elemem &&
chown ram:ram /usr/local/share/elemem
mkdir -p /usr/local/src/elemem &&
chown ram:ram /usr/local/src/elemem

# Slack

# Zoom

# Miscellaneous files
cp files/vimrc.local /etc/vim/vimrc.local
cp files/elemem /usr/local/bin/elemem

