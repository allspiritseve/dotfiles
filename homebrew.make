install: homebrew

homebrew: /usr/local/bin/brew \
	/usr/local/bin/git \
	/usr/local/bin/chruby-exec \
	/usr/local/bin/ruby-install \
	/usr/local/bin/psql \
	/usr/local/bin/mysql \
	/usr/local/bin/redis-server \
	/usr/local/bin/ack

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
