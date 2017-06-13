#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PGDATA=/usr/local/var/postgres/
export PGDATABASE=postgres
export LEIN_JAVA_CMD=/usr/local/bin/drip
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

unsetopt correct_all

# Some commons
alias v='LIGHT=1true vim'
alias md='mvim'
alias ml='LIGHT=1true mvim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'
alias gti='git'

alias resecto="mix ecto.drop && mix ecto.create && mix ecto.migrate && mix run priv/repo/seeds.exs"

alias clrf="perl -pi -e 's/\r/\n/g'"

# SERVERS
alias netstat_osx="lsof -i 4 -P -n"
alias floatingpoint="ssh root@178.62.198.200"

# OH MY ZSH begin
ZSH_THEME="afowler"
plugins=(osx brew tmux git git-flow gem mix cargo rbenv)
source $ZSH/oh-my-zsh.sh

# activate nvm
. ~/.nvm/nvm.sh

# load npm completion
source ~/.npm_completion

# load fzf
source ~/.fzf.zsh

# load exenv
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

