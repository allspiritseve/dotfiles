# zsh configuration

# Environment
export PS1="%n in %/ \$ "
export PATH=$HOME/bin:./bin:$PATH
export HISTFILE=~/.zsh_history
# export LESS=-R

# zsh
setopt histignorespace

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
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Local configuration
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi

fix_audio() {
  sudo killall VCDAssistant coreaudiod blued
  echo "Audio fixed."
}
