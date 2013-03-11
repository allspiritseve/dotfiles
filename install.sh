#!/bin/bash

export DOTFILES="$HOME/.dotfiles"

if ! [ -e "$DOTFILES" ]; then
  git clone git://github.com/allspiritseve/dotfiles.git "$DOTFILES"
fi

if ! [ -e "$HOME/.vim/autoload" ]; then
  ln -s $DOTFILES/autoload $HOME/.vim/autoload
fi

if ! [ -e "$HOME/.vim/bundle" ]; then
  ln -s $DOTFILES/bundle $HOME/.vim/bundle
fi

ln -sf $DOTFILES/.ackrc $HOME/.ackrc
ln -sf $DOTFILES/.gvimrc $HOME/.gvimrc
ln -sf $DOTFILES/.inputrc $HOME/.inputrc
ln -sf $DOTFILES/.vimrc $HOME/.vimrc
