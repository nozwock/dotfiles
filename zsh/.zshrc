setopt autocd autopushd
setopt nocaseglob

HISTFILE=~/.zsh_history
HISTSIZE=9999999
SAVEHIST=9999999
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export LANG=en_US.UTF-8
setopt appendhistory
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt INC_APPEND_HISTORY
unsetopt HIST_BEEP

setopt share_history # Share your history across all your terminal windows
setopt extended_glob # Enable more powerful glob features

fpath=(~/.zsh.d/ $fpath)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
export PLAYER='mpv'
export VISUAL=nvim
export EDITOR="$VISUAL"
export FILE="${EDITOR}"
export MANPAGER="nvim +Man!" # Add colors to man command.
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# vi-mode (by pressing 'ESC' or '^[' for normal mode and 'a' for insert mode)
bindkey "^?" backward-delete-char    # allows backspace to delete behind cursor
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

source_if_exists() {
  if [[ -r $1 ]]; then
    source $1
  fi
}

# if not exists already in PATH
add_to_path() {
    if [[ -d "$1" ]] ; then
        [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
    fi
}

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
add_to_path $HOME/.scripts/bin
source_if_exists $HOME/.zsh_aliases
add_to_path $HOME/.local/bin
add_to_path $HOME/.npm/bin
source_if_exists "$HOME/.cargo/env"
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source_if_exists "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light-mode for \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting \
    djui/alias-tips \
    supercrabtree/k \
    unixorn/fzf-zsh-plugin \
    zsh-users/zsh-completions
                #zdharma-continuum/history-search-multi-word
    #zsh-users/zsh-history-substring-search \

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

autoload -U compinit; compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# Add some completions settings
setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
setopt AUTO_MENU         # Show completion menu on a successive tab press.
setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
unsetopt MENU_COMPLETE   # Do not autoselect the first completion entry.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
add_to_path "$PNPM_HOME"
# pnpm end

# zellij
eval "$(zellij setup --generate-auto-start zsh)"
# end

