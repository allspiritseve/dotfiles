set nocompatible

filetype plugin indent on
execute pathogen#infect()
syntax enable
set background=dark
colorscheme solarized8
set modeline
set modelines=5

" Allow per-project .vimrc files
set exrc
set secure

set tabstop=2 shiftwidth=2
set expandtab

set encoding=utf-8
set scrolloff=3

" Backup
set backup
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory^=$HOME/.vim/tmp//
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set writebackup

set autoindent
set copyindent
set showmode
set showcmd
set hidden
set autowrite
set history=10000
set wildmenu
set wildmode=longest,list
set wildignore+=*/node_modules/*,*/tmp/*
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set number
set splitright
set splitbelow

set ignorecase smartcase
set shell=bash
set gdefault
set incsearch
set showmatch
set hlsearch

set nowrap

nnoremap j gj
nnoremap k gk

" Just kidding!
inoremap jk <ESC>

" Someday you will not need this...
" :inoremap <esc> <nop>

" Show me extra whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
autocmd Filetype markdown setlocal spell
:autocmd BufRead,BufNewFile /Users/cory/projects/paxos/* setlocal ts=4 sw=4
highlight EOLWS ctermbg=red guibg=red

let mapleader=" "

" Press space bar to remove search highlight
nmap <silent> <Leader><Leader> :nohlsearch<Bar>:echo<CR>

noremap <Leader>r :w<CR>:!clear && ruby % <CR>
noremap <Leader>i :w<CR>:!clear && irb -r ./% <CR>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" au BufRead,BufNewFile *.js,*.json set sw=4 ts=4
" au BufRead,BufNewFile *.rb set sw=2 ts=2

au BufRead,BufNewFile *.make setfiletype make
au BufRead,BufNewFile Thorfile setfiletype ruby

let g:ruby_indent_assignment_style = 'variable'

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

" Run tests
nnoremap <leader>t :w<cr>:let cmd='!beorn $(test_for_class %)'<bar>call histadd("cmd", cmd)<bar>execute cmd<cr>

" Run Rubocop
nnoremap <leader>r :w<cr>:!rubocop %<cr>

" Syntastic options
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Don't expand tabs to spaces in makefiles since actual tab characters
" are needed.
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType zsh set shiftwidth=4 tabstop=4 softtabstop=0

" Solarized
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
