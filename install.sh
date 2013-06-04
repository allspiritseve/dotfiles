#!/bin/bash

export DOTFILES="$HOME/.dotfiles"
export VIMHOME="$HOME/.vim"

test -d "$VIMHOME" || mkdir $VIMHOME
test -h "$VIMHOME/autoload" || ln -nsf $DOTFILES/autoload $VIMHOME/autoload
test -h "$VIMHOME/bundle" || ln -nsf $DOTFILES/bundle $VIMHOME/bundle
test -h "$VIMHOME/.ackrc" || ln -nsf $DOTFILES/.ackrc $HOME/.ackrc
test -h "$VIMHOME/.gvimrc" || ln -sf $DOTFILES/.gvimrc $HOME/.gvimrc
test -h "$VIMHOME/.inputrc" || ln -sf $DOTFILES/.inputrc $HOME/.inputrc
test -h "$VIMHOME/.vimrc" || ln -sf $DOTFILES/.vimrc $HOME/.vimrc
