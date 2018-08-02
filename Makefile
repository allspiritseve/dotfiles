home = /Users/cory
machine = $(home)/machine

-include $(machine)/local.make

_dotfiles = .ackrc .bashrc .bash_profile .editrc .gemrc .gitconfig .gitignore .inputrc .irbrc .selected_editor .tmux.conf .vimrc .bundle/config
dotfiles = $(foreach dotfile, $(_dotfiles), $(home)/$(dotfile))

_vimdirs = autoload bundle colors
vimdirs = $(foreach vimdir, $(_vimdirs), $(home)/.vim/$(vimdir))

_binfiles = ack aws brew git jq mysql redis-server ruby-install chruby-exec node dynalite heroku memcached postgres
binfiles = $(foreach binfile, $(_binfiles), /usr/local/bin/$(binfile))

_homedirs = .vim .bundle
homedirs = $(foreach homedir, $(_homedirs), $(home)/$(homedir))

_rubies = 2.3.6
rubies = $(foreach ruby, $(_rubies), $(home)/.rubies/ruby-$(ruby))

misc = /usr/local/etc/bash_completion

install: $(homedirs) $(vimdirs) $(dotfiles) $(binfiles) $(rubies) $(misc)

$(homedirs):
	mkdir $@

$(vimdirs): $(home)/%: $(machine)/%
	ln -nsf $< $@

$(dotfiles): $(home)/%: $(machine)/%
	ln -nsf $< $@

/usr/local/bin/aws:
	brew install awscli

/usr/local/bin/brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

/usr/local/bin/git:
	brew install git

/usr/local/bin/chruby-exec:
	brew install chruby

/usr/local/bin/ruby-install:
	brew install ruby-install

/usr/local/bin/postgres:
	brew install postgresql

/usr/local/bin/mysql:
	brew install mysql

/usr/local/bin/redis-server:
	brew install redis

/usr/local/bin/ack:
	brew install ack

/usr/local/bin/node:
	brew install node

/usr/local/bin/dynalite: /usr/local/bin/node
	npm install -g dynalite

/Users/cory/.rubies/ruby-%:
	ruby-install ruby $* --latest

/usr/local/bin/heroku:
	brew install heroku

/usr/local/bin/memcached:
	brew install memcached

/usr/local/bin/jq:
	brew install jq

/usr/local/etc/bash_completion:
	brew install bash-completion
