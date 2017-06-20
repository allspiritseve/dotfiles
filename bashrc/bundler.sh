#!/bin/bash

bundle_exec_command() {
  if [ -r ./Gemfile ]; then
    echo " -> bundle exec $@"
    bundle exec $@
  else
    command $@
  fi
}
export -f bundle_exec_command

for cmd in guard puma rackup rails rake rails rspec ruby sequel sidekiq unicorn
do
  eval "function ${cmd}() { bundle_exec_command $cmd \$@; }"
  export -f $cmd
done
