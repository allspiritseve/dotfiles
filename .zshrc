# zsh configuration

# Environment
export PS1="%n in %/ \$ "
# export PATH=$HOME/bin:./bin:$PATH
export PATH=$HOME/bin:./bin:$PATH
# export LESS=-R
export KUBECONFIG="$HOME/.kube/config"
export EDITOR=vim

# History
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
alias history="fc -l 1"
alias typora="open -a typora"

# zsh
setopt histignorespace

# less
# export LESS="R N"

# Report time for all commands that take more than 10 seconds
export REPORTTIME=10

# vi mode
bindkey -v
bindkey "^?" backward-delete-char

vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

# Homebrew git completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:~/bin/completions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Chruby
if [ -d $(brew --prefix)/share/chruby ]; then
  source $(brew --prefix)/share/chruby/chruby.sh
  source $(brew --prefix)/share/chruby/auto.sh
fi

chruby 3.2.1

# asdf
source /usr/local/opt/asdf/libexec/asdf.sh

# Local configuration
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi

# Python
export PATH=$HOME/Library/Python/3.9/bin:./bin:$PATH

fix_audio() {
  sudo killall VCDAssistant coreaudiod blued
  echo "Audio fixed."
}

docker_prune() {
  docker container prune -f \
    && (docker ps -q -f 'status=exited' | xargs docker rm) \
    && (docker images -q -f "dangling=true" | xargs docker rmi)
}

check_wireguard() {
    ssh cory@charlie.acremesh.us1c.b.gce.acreops.net 'sudo wg show all | tail -n 5 | grep handshake | cut -c 3-'
}
