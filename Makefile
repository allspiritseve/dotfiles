home = /Users/cory

dotfilenames = .ackrc .bashrc .bash_profile .editrc .gemrc .gitconfig .gitignore .gvimrc .inputrc .irbrc .ruby-version .selected_editor .tmux.conf .vimrc .railsrc
dotfiles = $(foreach dotfile, $(dotfilenames), $(home)/$(dotfile))

vimdirnames = autoload bundle colors
vimdirs = $(foreach vimdir, $(vimdirnames), $(home)/.vim/$(vimdir))

go: $(home)/.vim $(vimdirs) $(dotfiles) /usr/local/etc/mongod.conf

$(home)/.vim:
	mkdir $@

$(vimdirs): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@

$(dotfiles): $(home)/%: $(home)/.dotfiles/%
	ln -nsf $< $@

/usr/local/etc/mongod.conf: $(home)/.dotfiles/mongodb/mongod.conf
	cp $< $@