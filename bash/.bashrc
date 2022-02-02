#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100
# limits recursive functions, see 'man bash'

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/desktop/"
export XDG_DOWNLOAD_DIR="$HOME/downloads/"
export XDG_TEMPLATES_DIR="$HOME/templates/"
export XDG_PUBLICSHARE_DIR="$HOME/public/"
export XDG_DOCUMENTS_DIR="$HOME/documents/"
export XDG_MUSIC_DIR="$HOME/music/"
export XDG_PICTURES_DIR="$HOME/pictures/"
export XDG_VIDEOS_DIR="$HOME/videos/"
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

export EDITOR=vim

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

fman() {
    man -k . | fzf -q \'"$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' \
        | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"

fvim() {
    local fil
    fil="$(fd --type f -I -H --ignore-file /path/to/fvim.ignore/ | fzf --exact --preview="bat --color=always {}" --prompt="${EDITOR}> " --bind tab:preview-page-up,btab:preview-page-down -0)" && ${EDITOR} "${fil}" || return 1
}


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# "Importing" other scripts
source_if_exists ~/.bash_aliases

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

add_to_path $HOME/.local/bin

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

. "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(starship init bash)"
. <(poetry completions bash)

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
