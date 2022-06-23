#!/bin/bash

make

if [[ ! -d ~/.vim/pack/themes/opt/solarized8 ]]; then
  echo "clone"
  git clone https://github.com/lifepillar/vim-solarized8.git \
      ~/.vim/pack/themes/opt/solarized8
fi

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

echo "done"

if ! grep -q ServerAliveInterval ~/.ssh/config; then
  echo "ServerAliveInterval 60" >> ~/.ssh/config
fi
