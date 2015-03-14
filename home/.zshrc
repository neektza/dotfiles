#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="$HOME/.cabal/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export PGDATA=/usr/local/var/postgres/
export LEIN_JAVA_CMD=/usr/local/bin/drip
export EDITOR=vim

unsetopt correct_all

# Some commons
alias v='vim'
alias ml='LIGHT=1true vim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'
alias gti='git'

alias clrf="perl -pi -e 's/\r/\n/g'"

alias netstat_osx="lsof -i 4 -P -n"
alias bithub_prod="ssh bithub@69.164.216.88"
alias bithub_staging="ssh root@173.230.136.135"
alias bithub_testing="ssh root@88.80.184.65"
alias bithub_development="ssh bithub@192.168.99.99"
alias bithub_vagrant="ssh bithub@192.168.99.99"
alias floatingpoint="ssh root@178.62.198.200"

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

#########
# RBENV #
#########
export RBENV_ROOT=/usr/local/var/rbenv

###################
# OH MY ZSH begin # 
###################
ZSH_THEME="afowler"
plugins=(osx brew tmux git git-flow hub rbenv ruby gem bundler rails vagrant jekyll haskell cabal opam ctags lein)
source $ZSH/oh-my-zsh.sh

# added by travis gem
source /Users/neektza/.travis/travis.sh
