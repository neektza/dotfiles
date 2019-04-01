#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

unsetopt correct_all

# Some commons
alias gvl='LIGHT=1true gvim'
alias gvd='gvim'
alias vl='LIGHT=1true vim'
alias vd='vim'

# Search
alias ack='ack -r'
alias grep='egrep -i'

# Fuckups
alias gti='git'

# Docker & k8s
alias d="docker"
alias dc="docker-compose"
alias k='kubectl'
alias dclean='docker ps -a -f status=exited | grep -vi "datacontainer" | tail -n +2 | cut -c1-12 | xargs docker rm -v'
alias dcleanimages='docker images -q -f dangling=true | xargs docker rmi'
alias dcleanvolumes='docker volume ls -q | xargs docker volume rm'

alias resecto="mix ecto.drop && mix ecto.create && mix ecto.migrate && mix run priv/repo/seeds.exs"

alias clrf="perl -pi -e 's/\r/\n/g'"

# SERVERS
alias floatingpoint="ssh root@178.62.198.200"

# OH MY ZSH begin
ZSH_THEME="afowler"
plugins=(osx brew tmux git git-flow gem mix docker terraform kubectl helm)
source $ZSH/oh-my-zsh.sh

# load fzf
source ~/.fzf.zsh

# load denijev awesome tool
# eval "$(denv hook ZSH)"
