#!/bin/bash
iatest=$(expr index "$-" i)

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# If a tab-completed file is a symlink to a directory,
# treat it like a directory not a file
set mark-symlinked-directories on

# Use GNU ls colors when tab-completing files
set colored-stats on

alias gc="git clone"
alias gs="git status"

alias home="cd ~"
alias rm="rm -i"
alias mkdir="mkdir -pv"

# Expand the history size
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTTIMEFORMAT="%F %T "

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a'

shopt -s checkwinsize

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

export C_RED='\033[0;31m'
export C_GREEN='\033[0;32m'
export C_YELLOW='\033[0;33m'
export C_BLUE='\033[0;34m'
export C_PURPLE='\033[0;35m'
export C_CYAN='\033[0;36m'
export C_WHITE='\033[0;37m'
export C_DEFAULT='\e[m'

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'

# Search command line history
alias h="history | grep "

# Auto-complete command from history
# http://lindesk.com/2009/04/customize-terminal-configuration-setting-bash-cli-power-user/
export INPUTRC=~/.inputrc


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
. "$HOME/.cargo/env"

export PS1="\u \t \[$(tput sgr0)\]\[\033[38;5;6m\][\W]\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;1m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;15m\] \$ \[$(tput sgr0)\]"
export PATH="/mnt/c/Users/edmon/home/.local/share/solana/install/active_release/bin:$PATH"
