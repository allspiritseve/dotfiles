#!/bin/bash

export ACKRC=.ackrc
export ANDROID_HOME=/usr/local/opt/android-sdk
export CC=/usr/bin/gcc-4.2
export CLICOLOR=true
export DOTFILES=$HOME/.dotfiles
export EC2_HOME=$HOME/.ec2
export EDITOR=vim # :)
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=99999999
export HISTSIZE=99999999
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home # :(
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$EC2_HOME/bin"
export PATH="$PATH:$DOTFILES/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/MacOS/bin"
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"
export PATH="$PATH:/usr/local/share/python"
export PGDATA="$HOME/Library/Application Support/Postgres/var/"
export PS1="\u in \w \$ "

set -o vi # More trouble than it's worth?

if [ -f $DOTFILES/bashrc/bundler.sh ]; then
  source $DOTFILES/bashrc/bundler.sh # I don't wanna bundle exec
fi
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
