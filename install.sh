#!/bin/bash

export DOTFILES="$HOME/.dotfiles"
export VIMHOME="$HOME/.vim"

# Make sure .vim folder exists
test -d "$VIMHOME" || mkdir $VIMHOME

# Create symlinks to vim directories if they don't already exist
for dir in autoload bundle
do
  test -h $VIMHOME/$dir || ln -nsf $DOTFILES/$dir $VIMHOME/$dir
done

# Create symlinks to dotfiles if they don't already exist
for file in ackrc bashrc bash_profile gemrc gitignore gvimrc inputrc ruby-version selected_editor vimrc
do
  test -h "$HOME/.$file" || ln -nsf $DOTFILES/.$file $HOME/.$file
done

git config --global merge.ff only
git config --global push.default simple
git config --global user.email cory@corykaufman.com
git config --global user.name "Cory Kaufman-Schofield"
