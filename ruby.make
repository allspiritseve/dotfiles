_rubies = 2.3.6 $(cat .ruby-version)
rubies = $(foreach ruby, $(_rubies), $(home)/.rubies/ruby-$(ruby))

install: $(rubies)

/Users/cory/.rubies:
	mkdir $@

/Users/cory/.rubies/ruby-%: /Users/cory/.rubies
	ruby-install ruby $* --latest
