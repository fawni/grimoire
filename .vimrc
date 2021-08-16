set nocompatible
set rnu
set number
let mapleader = " "

" Helps force plugins to load correctly when it is turned back on below
filetype off

syntax on

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Automatic vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'wincent/terminus'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" :g exits even if in goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Mappings
nnoremap <silent> <Leader>l :Limelight!!<CR>
nnoremap <silent> <Leader>g :Goyo<CR>
nnoremap <silent> <Leader>z :Goyo<CR> :Limelight!!<CR>
nmap <silent> <leader>cc gcc
nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>q :q<cr>
nmap <silent> ; :Files<CR>
nmap <silent> <leader>e :NERDTreeToggle<CR>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

colo seoul256
let g:airline_theme='seoul256'
let g:airline_powerline_fonts = 1
set autoindent
set smartindent  
set incsearch  " Highlight as you search
set hlsearch   " Highlight the current search
set ignorecase " Make search case insensitive...
set smartcase  " ... except when we use uppercase letters
set incsearch
set lazyredraw
set showmatch

" Show file stats
set ruler

" No annoying error bills
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set noshiftround

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" No backup
set nobackup
set nowb
set noswapfile

" Make the backspace function normally
set backspace=indent,eol,start
