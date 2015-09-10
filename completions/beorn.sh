_beorn() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(beorn commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(beorn completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _beorn -o bashdefault -o default beorn
