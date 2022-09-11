" settings
source $HOME/.config/nvim/settings.vim

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim

    " plugins
    source $HOME/.config/nvim/plugins.vim
    " set runtimepath^=~/.vim runtimepath+=~/.vim/after
    " let &packpath=&runtimepath

    " remaps
    source $HOME/.config/nvim/remaps.vim

    " themes
    " source $HOME/.config/nvim/themes/ayu.vim
    source $HOME/.config/nvim/themes/onedark.vim
    " source $HOME/.config/nvim/themes/gruvbox.vim

endif
