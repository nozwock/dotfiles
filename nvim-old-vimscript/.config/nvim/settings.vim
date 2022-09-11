" set leader key
let g:mapleader = "\<Space>"
" let maplocalleader = "\\"

syntax enable   " Enables syntax highlighing
set encoding=UTF-8
" set exrc    " auto source vim configs in current dir

" show relative number lines
set nu
set relativenumber
set noerrorbells visualbell t_vb=   " audio bell disabled
set mouse+=a    " life support
" set nowrap

" tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set backspace=indent,eol,start
set shortmess+=I " no intro msg
set hidden  " keep multiple buffers open in bg...neat!
set nohlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=8

" for history n stuff
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
set undofile

set colorcolumn=88
set signcolumn=yes

" default updatetime of 4000ms = 4s leads to noticeable
" delays and poor perf
set updatetime=50

" use sys clipboard
" set clipboard+=unnamedplus

" suda.vim
let g:suda_smart_edit = 1
