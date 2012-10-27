#!/bin/bash
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Some commons
alias m='mvim'
alias ack='ack -ri'
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias ll='ls -lah'

# Ruby and Rails
alias be='bundle exec'

###########
# GIT+HUB #
###########
alias git=hub

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
alias meteor-sandbox='ssh meteor@212.78.225.69'
alias meteor-forms='ssh forms@forms.meteor.ie'
alias storestaging='ssh storestaging@84.51.250.240'
alias storeproduction='ssh storeproduction@84.51.250.240'
alias formsproduction='ssh forms@84.51.250.240'
alias emobile-box='ssh emobadmin@10.168.12.2'

alias lambda_box_nj='ssh nikicajokic@lambda.huguenot-xmi.com'
alias mu_box_nj='ssh nikicajokic@mu.huguenot-xmi.com'
alias marvin='ssh neektza@marvin.kset.org'

#############
# MYSQL gem #
#############
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

##############
# Load RBenv #
##############
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

##############
# True ctags #
##############
export PATH="~/bin/:/usr/local/bin:$PATH"

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash 
fi
