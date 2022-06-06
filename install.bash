#!/bin/bash

make

if [[ ! -d ~/.vim/pack/themes/opt/solarized8 ]]; then
  echo "clone"
  git clone https://github.com/lifepillar/vim-solarized8.git \
      ~/.vim/pack/themes/opt/solarized8
fi

echo "done"
