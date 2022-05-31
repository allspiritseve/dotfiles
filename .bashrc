#!/bin/bash

export ACKRC=.ackrc
export CLICOLOR=true
export EDITOR=vim # =)
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTFILESIZE=99999999
export HISTSIZE=99999999
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"
export PS1="\u in \w \$ "

# AWS
export EC2_HOME=$HOME/.ec2
export PATH="$EC2_HOME/bin:$PATH"

# Dotfiles
export DOTFILES=$HOME/machine
export PATH="$DOTFILES/bin:$PATH"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

for file in $DOTFILES/bashrc/*; do
  [ -r $file ] && source $file
done

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$PATH"

# Node
export PATH="./node_modules/.bin:$PATH"
# export PATH="/usr/local/opt/node@8/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
export RUBYMOTION_ANDROID_NDK=$HOME/Library/Android/ndk
export RUBYMOTION_ANDROID_SDK=$HOME/Library/Android/sdk

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
# if [ -f $HOME/.ruby-version ]; then
#   chruby $(cat $HOME/.ruby-version)
# fi

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias postgres.server='pg_ctl -l "$PGDATA/postgresql.log"'
alias audit_backups='ls -l ~/backups/audit | cut -c 31- | tail -n +2'

function list_merged_git_branches() {
  git branch --merged master | cut -c 3- | grep -v -E '(master|production)'
}

function fix_audio() {
  sudo killall VCDAssistant coreaudiod blued
  echo "Audio fixed."
}

function docker_prune() {
  docker container prune -f \
    && (docker ps -q -f 'status=exited' | xargs docker rm) \
    && (docker images -q -f "dangling=true" | xargs docker rmi)
}

# Enable vi mode
set -o vi

if [ -f $DOTFILES/bashrc/bundler.sh ]; then
  source $DOTFILES/bashrc/bundler.sh # I don't wanna bundle exec
fi

for script in /etc/profile.d/*.sh; do
  [ -r $script ] && source $script
done

# Bash shell completion
# if type brew &>/dev/null; then
#   for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*; do
#     [[ -f $COMPLETION ]] && source "$COMPLETION"
#   done
#   if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]]; then
#     source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
#   fi
# fi

# Bash completion
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  source "/usr/local/etc/profile.d/bash_completion.sh"
fi

# source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/Cellar/git/*/etc/bash_completion.d/git-completion.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Google Cloud SDK
if [ -f '/Users/cory/Downloads/google-cloud-sdk/path.bash.inc' ]; then
  source '/Users/cory/Downloads/google-cloud-sdk/path.bash.inc'
fi

if [ -f '/Users/cory/Downloads/google-cloud-sdk/completion.bash.inc' ]; then
  source '/Users/cory/Downloads/google-cloud-sdk/completion.bash.inc'
fi

# Local configuration
if [ -f ~/.bashrc-local ]; then
  source ~/.bashrc-local
fi

# libxml2
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cory/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cory/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cory/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cory/google-cloud-sdk/completion.bash.inc'; fi
