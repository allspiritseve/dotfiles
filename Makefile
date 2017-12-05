home = /Users/cory

_dotfiles = .ackrc .bashrc .bash_profile .editrc .gemrc .gitconfig .gitignore .inputrc .irbrc .selected_editor .tmux.conf .vimrc .bundle/config
dotfiles = $(foreach dotfile, $(_dotfiles), $(home)/$(dotfile))

_vimdirs = autoload bundle colors
vimdirs = $(foreach vimdir, $(_vimdirs), $(home)/.vim/$(vimdir))

_binfiles = brew git ack mysql redis-server ruby-install chruby-exec node dynalite heroku memcached
binfiles = $(foreach binfile, $(_binfiles), /usr/local/bin/$(binfile))

install: $(home)/.vim \
	$(vimdirs) \
	$(dotfiles) \
	$(binfiles) \
	/Users/cory/.rubies/ruby-2.3.4

# /usr/local/bin/postgres

$(home)/.vim:
	mkdir $@

$(vimdirs): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@

$(dotfiles): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@

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

/Users/cory/.rubies/ruby-2.3.4:
	ruby-install ruby 2.3.4

/usr/local/bin/heroku:
	brew install heroku

/usr/local/bin/memcached:
	brew install memcached
