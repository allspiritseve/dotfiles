#!/bin/bash

bundle_exec() {
  if [ -r ./Gemfile ]; then
    echo " -> bundle exec $@"
    bundle exec $@
  else
    $@
  fi
}
export -f bundle_exec

for cmd in guard puma rackup rails rake rails rspec sequel sidekiq unicorn
do
  eval "function ${cmd}() { bundle_exec $cmd \$@; }"
  export -f $cmd
done
