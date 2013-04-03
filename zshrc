#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR=vim

# Some commons
alias v='vim'
alias m='mvim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'
alias gphm='git push heroku master'
alias gpom='git push origin master'

alias netstat_osx="lsof -i 4 -P -n"
alias zshconfig="mvim ~/dotfiles/zshrc"
alias ohmyzsh="mvim ~/.oh-my-zsh"
alias mongolab="mongo ds039707.mongolab.com:39707/heroku_app7670072 -u heroku_app7670072 -p bc1vc25hr8ola87c5cvpcet0gq"
alias mongohq="mongo rose.mongohq.com:10049/app7670072 -u heroku -p e2f5d8946640033b06a0492d37962086"
alias mongohq-staging="mongo linus.mongohq.com:10090/app11590549 -u heroku -p 432b46ea679528e1d769a8675d53ae0d"
alias mongohq-testing="mongo linus.mongohq.com:10027/app11590671 -u heroku -p 5096a59c8898fffd8544567650e12a9c"

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
plugins=(osx brew git git-flow hub rbenv ruby gem bundler lein node mvn npm rails) 
source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
