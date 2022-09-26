" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" themes
" Plug 'morhetz/gruvbox'
Plug 'lambdalisue/suda.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'Shatur/neovim-ayu'
" statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Plug 'psliwka/vim-smoothie'

" Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
