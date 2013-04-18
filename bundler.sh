#!/bin/bash

function bundle_exec () {
  if [ -r ./Gemfile ]; then
    echo " -> bundle exec $@"
    bundle exec $@
  else
    $@
  fi
}

for cmd in rake rails unicorn rackup
do
  alias $cmd="bundle_exec $cmd"
done
