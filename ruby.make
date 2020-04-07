_rubies = 2.6.3 $(ls .ruby-version)
rubies = $(foreach ruby, $(_rubies), $(HOME)/.rubies/ruby-$(ruby))

install: $(rubies)

$(HOME)/.rubies:
	mkdir $@

$(HOME)/.rubies/ruby-%: /Users/cory/.rubies
	ruby-install ruby $* --latest --no-install-deps
