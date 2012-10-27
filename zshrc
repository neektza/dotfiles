#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR=vim

# Some commons
alias v='vim'
alias m='mvim'
alias ack='ack -ri'
alias grep='egrep -i'

alias netstat_osx="lsof -i 4 -P -n"
alias zshconfig="mvim ~/dotfiles/zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"

#########
# RAILS #
#########
alias _last_migration='echo db/migrate/`ls -Atr db/migrate/ | tail -1 `'

###########
# SERVERS #
###########
alias marvin='ssh neektza@marvin.kset.org'
alias roosta='ssh neektza@roosta.kset.org'
alias magrathea='ssh neektza@magrathea.kset.org -p 1022'

###################
# OH MY ZSH begin # 
###################
ZSH_THEME="afowler"

source $ZSH/oh-my-zsh.sh
plugins=(git git-flow osx brew ruby gem bundler) 
