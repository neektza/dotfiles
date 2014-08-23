#!/bin/bash
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Some commons
alias m='mvim'
alias ll='ls -lah'

######################################
# Vim is the default editor, BUAHAHA #
######################################
export EDITOR=vim

###########
# SERVERS #
###########
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
