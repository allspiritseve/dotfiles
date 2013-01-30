#!/bin/bash

export DOTFILES="$HOME/.dotfiles"

if ! [ -e "$DOTFILES" ]; then
  git clone git://github.com/allspiritseve/dotfiles.git "$DOTFILES"
fi
