# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# navigation
alias ~='cd ~'
alias ..='cd ..' 
alias ...='cd ../..'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Changing "ls" to "exa"
# stolen from @umgbhalla
alias la='(exa -ahl --color=always --group-directories-first ) | bat ' # my preferred listing
alias lr='(exa -R --color=always --group-directories-first) |bat '  # all files and dirs
alias ll='(exa -al --color=always --group-directories-first) '  # all files and dirs
alias ld='(exa -l --color=always --group-directories-first) | bat'  # long format
alias lt='(exa -aT --color=always --group-directories-first)| bat' # tree listing
alias l.='exa -a | egrep "^\." | bat'
alias g="grep"
alias ls='exa --icons --color=always --group-directories-first'
alias lcr='exa -lhFT --color=always --icons --sort=size --group-directories-first'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# programs
alias b='bat'
alias tmux='tmux -u' # i don know...emojis & some chars don't render otherwise
alias code='codium'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# confirm before removing something
alias rm='rm -iv'
alias rmf="rm -f"
alias rmrf="rm -rf"
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# pkg managers
alias pru='paru'
alias prur='paru -Rcns'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Colorize grep output (good for log files)
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# hashes
alias md5='md5sum'
alias s128='sha128sum'
alias s256='sha256sum'
alias s512='sha512sum'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
