dotfiles=$HOME/.dotfiles

if [ -f $dotfiles/bashrc/bundler.sh ]; then
  source $dotfiles/bashrc/bundler.sh
fi

export ACKRC='.ackrc'
export CC=/usr/bin/gcc-4.2
export CLICOLOR=true
export EDITOR=vim
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EC2_HOME="$HOME/.ec2"
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
export PATH="$PATH:$EC2_HOME/bin"
export PGDATA="/Users/cory/Library/Application Support/Postgres/var/"
export ANDROID_HOME=/usr/local/opt/android-sdk

BLACK=$'\e[0m\]'
GREEN=$'\e[32m\]'
BOLD=$'\033[1;30m\]'
WHITE=$'\033[1;37m\]'

# export PS1="\u$(__git_ps1 " on ${GREEN}%s${BLACK}") in \W \$ "
export PS1="\u in \w \$ "

set -o vi

source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
