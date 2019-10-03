#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# paths
export PATH=$HOME/bin:/usr/local/bin:$HOME/.bin:$HOME/.scripts:$PATH

# completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# defaults
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"

# fff config
if [ -f $HOME/.config/fff/config ]; then
    . $HOME/.config/fff/config
fi

# fzf
. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash

export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'

# binds
bind Space:magic-space
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous On"
bind "set mark-symlinked-directories on"
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# gpg pw on term
export GPG_TTY=$(tty)

# shell opts
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s histappend
shopt -s expand_aliases
shopt -s checkwinsize
shopt -s globstar 2> /dev/null
shopt -s nocaseglob
shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null

# colors in less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# history
HISTSIZE= 
HISTFILESIZE=
HISTCONTROL="erasedups:ignoredups:ignorespace"
PROMPT_COMMAND='history -a'
HISTTIMEFORMAT='%F %T '

# prompt
#export PS1="➜  \[$(tput setaf 4)\]\W\[$(tput sgr0)\] "
export PS1='\W \[\e[34m\] \[\e[0m\]'

# ow & tw dir color
export LS_COLORS="$LS_COLORS:ow=1;35:tw=1;35:"

# aliases
. ~/.aliases
