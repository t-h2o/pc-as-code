"	~/.vimrc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set listchars=trail:»,tab:»-
set linebreak

syntax on
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set title
set mouse=a

let mapleader = ","

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
