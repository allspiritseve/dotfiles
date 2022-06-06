# Dotfiles

## New Machine

1. Install [iTerm](https://iterm2.com)

1. Install [Homebrew](https://brew.sh/)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

1. Install [1Password](https://downloads.1password.com/mac/1Password.zip)

1. Install [Slack](https://slack.com/downloads/mac)

1. Generate SSH key

    ssh-keygen -t ed25519 -C "cory@townstage.com"

    # Add to ssh-agent
    eval "$(ssh-agent -s)"

## Instructions

1. Clone repo

    git clone git@github.com:allspiritseve/dotfiles.git ~/machine

1. Run `make`

    cd ~/machine
    make
