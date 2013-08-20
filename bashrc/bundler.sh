#!/bin/bash

function bundle_exec () {
  if [ -r ./Gemfile ]; then
    echo " -> bundle exec $@"
    bundle exec $@
  else
    $@
  fi
}

for cmd in guard puma rackup rails rake rails sequel sidekiq unicorn
do
  alias $cmd="bundle_exec $cmd"
done
