set nocompatible
set rnu
set number
let mapleader = " "

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)


syntax on
set autoindent
set smartindent  
" ================ Search Settings  ================= "

set incsearch  " Highlight as you search
set hlsearch   " Highlight the current search
set ignorecase " Make search case insensitive...
set smartcase  " ... except when we use uppercase letters

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd
