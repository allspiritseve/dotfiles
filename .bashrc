#!/bin/bash

export ACKRC=.ackrc
export CLICOLOR=true
export EDITOR=vim # :)
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=99999999
export HISTSIZE=99999999
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
export PS1="\u in \w \$ "
export TZ="America/Detroit"

# AWS
export EC2_HOME=$HOME/.ec2
export PATH="$EC2_HOME/bin:$PATH"

# Dotfiles
export DOTFILES=$HOME/.dotfiles
export PATH="$DOTFILES/bin:$PATH"

for file in $DOTFILES/bashrc/*; do
  [ -r $file ] && source $file
done

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Kubernetes
export KUBECONFIG=$HOME/.kube/staging/config:$HOME/.kube/production/config

# Go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$PATH"

# Node
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/opt/node@6/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
export RUBYMOTION_ANDROID_NDK=$HOME/Library/Android/ndk
export RUBYMOTION_ANDROID_SDK=$HOME/Library/Android/sdk

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}

function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

setjdk 1.7

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias postgres.server='pg_ctl -l "$PGDATA/postgresql.log"'
alias audit_backups='ls -l ~/backups/audit | cut -c 31- | tail -n +2'

function list_merged_git_branches() {
  git branch --merged master | cut -c 3- | grep -v ^master$
}

# Enable vi mode
set -o vi

if [ -f $DOTFILES/bashrc/bundler.sh ]; then
  source $DOTFILES/bashrc/bundler.sh # I don't wanna bundle exec
fi

for script in /etc/profile.d/*.sh; do
  [ -r $script ] && source $script
done

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

source /usr/local/etc/bash_completion.d/beorn

# source /usr/local/git/contrib/completion/git-completion.bash

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# chruby ruby-2.3.3


# Google Cloud SDK
if [ -f '/Users/cory/Downloads/google-cloud-sdk/path.bash.inc' ]; then
  source '/Users/cory/Downloads/google-cloud-sdk/path.bash.inc'
fi

if [ -f '/Users/cory/Downloads/google-cloud-sdk/completion.bash.inc' ]; then
  source '/Users/cory/Downloads/google-cloud-sdk/completion.bash.inc'
fi
