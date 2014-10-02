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
# export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home # :(
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$EC2_HOME/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PGDATA="$HOME/Library/Application Support/Postgres93/var/"
export PS1="\u in \w \$ "
export CDPATH=$CDPATH:$HOME/projects:$HOME/Document

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
alias git_clobber='git clean -df; git checkout -- .'

set -o vi # More trouble than it's worth?

if [ -f $DOTFILES/bashrc/bundler.sh ]; then
  source $DOTFILES/bashrc/bundler.sh # I don't wanna bundle exec
fi

for script in /etc/profile.d/*.sh; do
  [ -r $script ] && source $script
done

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# source /usr/local/git/contrib/completion/git-completion.bash
