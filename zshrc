#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH=$PATH:$HOME/bin

export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export PGDATABASE=postgres

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
alias ko='kops'
alias dclean='docker ps -a -f status=exited | grep -vi "datacontainer" | tail -n +2 | cut -c1-12 | xargs docker rm -v'
alias dcleanimages='docker images -q -f dangling=true | xargs docker rmi'
alias dcleanvolumes='docker volume ls -q | xargs docker volume rm'
alias ag=rg

alias clrf="perl -pi -e 's/\r/\n/g'"

# Direnv
eval "$(direnv hook zsh)"

# OH MY ZSH begin
ZSH_THEME="sonicradish"
plugins=(git git-flow fzf asdf brew ripgrep npm node pipenv ag)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
