#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="$HOME/.cabal/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
export PGDATA=/usr/local/var/postgres/
export LEIN_JAVA_CMD=/usr/local/bin/drip
export PGDATABASE=bithub_development
export EDITOR=vim

unsetopt correct_all

# Some commons
alias v='vim'
alias m='mvim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'

alias clrf="perl -pi -e 's/\r/\n/g'"

alias netstat_osx="lsof -i 4 -P -n"
alias zshconfig="mvim ~/dotfiles/zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias bithub_prod="ssh bithub@69.164.216.88"
alias bithub_staging="ssh bithub@173.230.136.135"
alias bithub_testing="ssh bithub@88.80.184.65"
alias moj="ssh neektza@95.85.18.108"
alias bitovi="ssh neektza@107.170.249.76"

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
plugins=(osx brew git git-flow hub rbenv ruby gem bundler node npm rails vagrant jekyll cabal virtualenv virtualenvwrapper ctags)
source $ZSH/oh-my-zsh.sh

# added by travis gem
source /Users/neektza/.travis/travis.sh
