#!/bin/bash

SCRIPTDIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" >/dev/null 2>&1 && pwd)"

cd "$SCRIPTDIR"

fwupdmgr update

apt install -y vim-gtk3 xserver-xorg-input-synaptics aptitude git cmake curl apt-file autoconf automake rustc cargo cheese clang clisp dos2unix doxygen eog libreoffice wine lftp gfortran ghc galculator gimp-data-extras golang-go grip gsfonts gv hexedit idle inotify-tools net-tools ispell kdenlive latex2rtf latexdraw llvm lyx w3m maxima wxmaxima mercurial mplayer vlc smplayer mpv mtools mypy neovim nmap nodejs oathtool obs-studio obs-plugins octave okular openssh-server openssh-sftp-server p7zip pandoc pdf2svg php ps2eps psutils pybind11-dev fftw-dev fftw2 libfftw3-bin libfftw3-dev python3-numpy python3-scipy python3-matplotlib python3-seaborn python3-setuptools python3-sympy python3-toml python3-sklearn qemu-system-x86 qtbase5-dev qtcreator rename radeontop retext gitk samba screen scribus spell sshfs subversion unrar webp whois wmctrl xsel

snap install chromium signal-desktop telegram-desktop typst

# Slack

# Zoom

