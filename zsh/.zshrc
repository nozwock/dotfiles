# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
path_append() {
  local dir="$1"
  if [[ -d "$dir" ]] && [[ ":$PATH:" != *":$dir:"* ]]; then
    export PATH="${PATH:+$PATH:}${dir}"
  fi
}

path_prepend() {
  local dir="$1"
  if [[ -d "$dir" ]] && [[ ":$PATH:" != *":$dir:"* ]]; then
    export PATH="${dir}${PATH:+:$PATH}"
  fi
}

rand_string() {
    ! [[ "$1" =~ '^[0-9]+$' ]] && return 1
    echo -n "$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c $1)"
}

vera_mount() {
    if [ -z "${1+x}" ]; then
        echo "Error: No volume passed."
        return 1
    else
        [ ! -f "$1" ] && echo "Error: No such volume found '$(readlink -f $1)'" && return 1
        mount_dir="$(sudo mkdir -p /run/media/$USER/vera.$(rand_string 8))"
        sudo veracrypt --text --mount "$1" "$mount_dir" || return 1
        zenity --notification --text "Veracrypt\nContainer '$(basename $1)' successfully mounted"
    fi
}

# can be improved
vera_pop() {
    sudo veracrypt -t --dismount --slot=1 || return 1
    zenity --notification --text "Veracrypt\nSlot 1 dismounted"
}

killtree() {
    local pid="$1"
    local children=$(pgrep -P "$pid")

    for child in $children; do
        killtree "$child"
    done

    echo "kill $pid"
    kill "$pid"
}


cd__() {
  cd "$(printf "%0.s../" $(seq 1 $1 ))"
}

steamurl() {
    steam "steam://openurl/$1"
}

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
source_if_exists $HOME/.zsh_aliases
source_if_exists "$HOME/.cargo/env"
path_append $HOME/.scripts/bin
path_append $HOME/.local/bin
path_append $HOME/.npm/bin
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
    zsh-users/zsh-completions
    # unixorn/fzf-zsh-plugin \
    # zdharma-continuum/history-search-multi-word \
    # zsh-users/zsh-history-substring-search \

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
path_append "$PNPM_HOME"
# pnpm end

export GOPATH="$HOME/.local/share/go"
path_append "$GOPATH/bin"

# FZF
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --height=80%'
export FZF_ALT_C_COMMAND='fd --hidden -td'
export FZF_CTRL_T_COMMAND='fd --hidden -tf'
source <(fzf --zsh)

# Fuzzy Find Commands
bins() {
    print -z -- "$(echo -n "$PATH" | xargs -d ':' -I '{}' -- sh -c 'test -d "{}" && fd -d1 --follow -tx . "{}"' | xargs -- basename -a | fzf) "
}
zle -N fzf-bins bins
bindkey '^e' fzf-bins # Ctrl+e

