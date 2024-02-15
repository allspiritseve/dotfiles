#!/usr/bin/env zsh

make -s

if [[ ! -d ~/.vim/pack/themes/opt/solarized8 ]]; then
  echo "clone"
  git clone https://github.com/lifepillar/vim-solarized8.git \
      ~/.vim/pack/themes/opt/solarized8
fi

defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

if ! grep -q ServerAliveInterval ~/.ssh/config; then
  echo "ServerAliveInterval 60" >> ~/.ssh/config
fi

# if ! [ -e "$HOME/.oh-my-zsh" ]; then
#   curl -L https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
# fi

if ! brew ls --versions tfenv > /dev/null; then
    brew install tfenv
fi


if ! brew ls --versions bash-completion > /dev/null; then
    brew install bash-completion
fi

if which gh > /dev/null; then
    if [[ $(gh config get editor) != "vim" ]]; then gh config set editor vim; fi
fi

# Local configuration
if [ -f local.zsh ]; then
  source local.zsh
fi

