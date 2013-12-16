set nocompatible

filetype off
execute pathogen#infect()
syntax enable
set background=dark
colorscheme solarized
filetype plugin indent on
set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set autoindent
set copyindent
set showmode
set showcmd
set hidden
set autowrite
set history=10000
set wildmenu
set wildmode=longest,list
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set number
set splitright

set ignorecase smartcase
set shell=bash
set gdefault
set incsearch
set showmatch
set hlsearch

set nowrap

" One day you will not need these...
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Just kidding!
inoremap jk <ESC>

" Show me extra whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
autocmd Filetype markdown setlocal spell
highlight EOLWS ctermbg=red guibg=red
