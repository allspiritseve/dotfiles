#!/bin/bash

export ACKRC=.ackrc
export ANDROID_HOME=$HOME/Library/Android/sdk
export CLICOLOR=true
export DOCKER_CERT_PATH=/Users/cory/.boot2docker/certs/boot2docker-vm
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_TLS_VERIFY=1
export DOTFILES=$HOME/.dotfiles
export EC2_HOME=$HOME/.ec2
export EDITOR=vim # :)
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=99999999
export HISTSIZE=99999999
# export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home # :(
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$DOTFILES/bin:$PATH"
export PATH="$EC2_HOME/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PGDATA="$HOME/Library/Application Support/Postgres/var-9.4/"
export PS1="\u in \w \$ "
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

if [ -f $DOTFILES/bashrc/bundler.sh ]; then
  source $DOTFILES/completions/beorn.sh
fi

# source /usr/local/git/contrib/completion/git-completion.bash
