#!/bin/zsh
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Some commons
alias v='vim'
alias m='mvim'
alias ack='ack -ri'
alias grep='egrep -i'
alias ss='script/server'
alias todo='todo.sh'
alias netstat_osx="lsof -i 4 -P -n"

######################################
# Vim is the default editor, BUAHAHA #
######################################
export EDITOR=vim

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

alias zshconfig="mvim ~/dotfiles/zsh_profile"
alias ohmyzsh="mvim ~/.oh-my-zsh"

