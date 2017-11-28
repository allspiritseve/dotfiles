install: /usr/local/bin/brew /usr/local/bin/git

/usr/local/bin/brew:
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

/usr/local/bin/git:
  brew install git
