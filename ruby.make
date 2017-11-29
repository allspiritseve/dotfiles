install: /Users/cory/.rubies /Users/cory/.rubies/ruby-2.3.4

/Users/cory/.rubies:
  mkdir $@

/Users/cory/.rubies/ruby-2.3.4:
  ruby-install ruby 2.3.4
