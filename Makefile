home = /Users/cory

dotfilenames = .ackrc .bashrc .bash_profile .gemrc .gitignore .gvimrc .inputrc .ruby-version .selected_editor .tmux.conf .vimrc
dotfiles = $(foreach dotfile, $(dotfilenames), $(home)/$(dotfile))

vimdirnames = autoload bundle
vimdirs = $(foreach vimdir, $(vimdirnames), $(home)/.vim/$(vimdir))

go: $(home)/.vim $(vimdirs) $(dotfiles) git

git:
	git config --global merge.ff only
	git config --global push.default simple
	git config --global user.email cory@corykaufman.com
	git config --global user.name "Cory Kaufman-Schofield"

$(home)/.vim:
	mkdir $@

$(vimdirs): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@

$(dotfiles): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@
