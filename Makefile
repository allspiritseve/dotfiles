SHELL = /bin/bash

machine = $(HOME)/machine

-include $(machine)/local.make
# include $(machine)/ruby.make

_dotfiles = .ackrc .bashrc .bash_profile .editrc .gemrc .gitconfig .gitignore .inputrc .irbrc .ruby-version .selected_editor .tmux.conf .vimrc .bundle/config .zshrc
dotfiles = $(foreach dotfile, $(_dotfiles), $(HOME)/$(dotfile))

_vimdirs = autoload bundle pack colors
vimdirs = $(foreach vimdir, $(_vimdirs), $(HOME)/.vim/$(vimdir))

_binfiles = ack aws brew git jq redis-server ruby-install chruby-exec node memcached watch
binfiles = $(foreach binfile, $(_binfiles), $(shell brew --prefix)/bin/$(binfile))

_homedirs = .vim .bundle
homedirs = $(foreach homedir, $(_homedirs), $(HOME)/$(homedir))

misc = /usr/local/etc/bash_completion

# install: $(homedirs) $(vimdirs) $(binfiles) $(sbinfiles) $(dotfiles) $(misc)

install:  $(homedirs) $(vimdirs) $(binfiles) $(sbinfiles) $(dotfiles)

$(homedirs):
	mkdir $@

$(vimdirs): $(HOME)/%: $(machine)/%
	ln -nsf $< $@

$(dotfiles): $(HOME)/%: $(machine)/%
	ln -nsf $< $@

$(shell brew --prefix)/bin/aws:
	brew install awscli

/opt/homebrew/bin/brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$(shell brew --prefix)/bin/git:
	brew install git

$(shell brew --prefix)/bin/chruby-exec:
	brew install chruby

$(shell brew --prefix)/bin/ruby-install:
	brew install ruby-install

$(shell brew --prefix)/bin/mysql:
	brew install mysql

$(shell brew --prefix)/bin/redis-server:
	brew install redis

$(shell brew --prefix)/bin/ack:
	brew install ack

$(shell brew --prefix)/bin/node:
	brew install node

$(shell brew --prefix)/bin/jq:
	brew install jq

$(shell brew --prefix)/etc/bash_completion:
	brew install bash-completion

$(shell brew --prefix)/bin/watch:
	brew install watch
