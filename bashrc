#!/bin/bash

# Some commons
alias ack='ack-grep -ri'
alias grep='grep -ri'

# Speedups
alias svnrm='find . -name *.svn* | xargs rm -rf'

alias worky='cd /media/sandbox/workspace'

#########
# RAILS #
#########
alias sc='script/console'
alias ss='script/server' # use "ss -d" to detach
alias sg='script/generate'
alias _last_migration='echo db/migrate/`ls -Atr db/migrate/ | tail -1 `'
alias last_migration_edit='g `_last_migration`'
alias migrate='rake db:migrate'
alias bi='bundle install'


###########
# SERVERS #
###########
alias met-store-box = 'ssh storestaging@store.meteor.ie'
alias met-ie-box = 'ssh meteor@meteor-sandbox.rubylithcms.com'

############
# Load RVM #
############
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
