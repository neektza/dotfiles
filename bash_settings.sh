#!/bin/bash

# Some commons
export GIT_EDITOR=vim
#export RAILS_ENV=development_emobile #only one vt needs this
alias ack='ack -ri'
alias grep='grep -ri'

EDITOR=vim
export EDITOR

# carr's
# TODO da gleda ako je na linuxu da bude gedit, ako je na macu textmate, ako je na windowsima da pomoli Ocenas
alias g='mate'
alias n='nautilus'
alias q='exit'
alias vz1='ssh www-data@vz1.infinum.hr'
alias vz2='ssh www-data@vz2.infinum.hr'
alias vz3='ssh www-data@vz3.infinum.hr'
alias drago='ssh carr@drago.kicks-ass.org'
alias marvin='ssh neektza@marvin.kset.org'
alias remote='ssh -t www-data@iss.infinum.hr "cd `cap remote_path -q`; screen -q"'
alias cl='clear'
alias first_push='git push origin master:refs/heads/master'

#alias setdir="pwd | pbcopy"
#alias getdir="cd `pbpaste`"

########
# J2ME #
########
alias runjad='~/Programs/WTK2.5.2/bin/emulator'

#######
# git #
#######
# source git-completion.bash

alias gl='git pull'
alias gp='git push'
alias gd='git deploy'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch -v'
alias ga='git add'

function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

function st {
  if [ -d ".svn" ]; then
    svn status
  else
    git status
  fi
}

#######
# SVN #
#######
alias sup='svn up' # trust me 3 chars makes a difference
# alias sstu='svn st -u' # remote repository changes
# alias scom='svn commit' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

########
# RUBY #
########

## really awesome function, use: cdgem <gem name>, cd's into your gems directory
## and opens gem that best matches the gem name provided
#function cdgem {
#  cd `gem env gemdir`/gems
#  cd `ls | grep $1 | sort | tail -1`
#}
##function gemdoc {
##  GEMDIR=`gem env gemdir`/doc
##  chromium-browser $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`/rdoc/index.html
##}
#
## ista verzija ko gore samo autocomplete
#export GEMDIR=`gem env gemdir`
#
#gemdoc() {
#  local gems=($GEMDIR/doc/$1*/rdoc/index.html)
#  chromium-browser ${gems[@]: -1}
#}
#
#complete -W '$(`which ls` $GEMDIR/doc)' gemdoc

alias qri='qri -w 98'
alias fri='fri -w 98'

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

########
# misc #
########

alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'
alias h='history'
alias j="jobs -l"
alias l="ls -lah"
alias ll="ls -l"
alias la='ls -A'
alias size='du -hs'
# alias pu="pushd"
# alias po="popd"

########

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
