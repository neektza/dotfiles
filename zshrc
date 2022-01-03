#!/bin/zsh

function _get_cluster_short() {
  echo "$1" | cut -d \/ -f2 | cut -d \. -f1
}

function _aws_profile_info() {
  local _AWS_PS1_OPEN_ESC="%{"
  local _AWS_PS2_CLOSE_ESC="%}"
  local _AWS_PS1_DEFAULT_FG="%f"
  
  local AWS_PS1_RESET_COLOR="${_AWS_PS1_OPEN_ESC}${_AWS_PS1_DEFAULT_FG}${_AWS_PS1_CLOSE_ESC}"
  
  [[ -z $AWS_PROFILE ]] && return
  echo "${ZSH_THEME_AWS_PREFIX:=<}$(_kube_ps1_color_fg $AWS_PS1_PROFILE_COLOR)${AWS_PROFILE}${AWS_PS1_RESET_COLOR}${ZSH_THEME_AWS_SUFFIX:=>}"
}


ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH=$PATH:$HOME/bin

export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export PGDATABASE=postgres

# Plugin settings - Kube PS1
# export KUBE_PS1_SYMBOL_ENABLE=false
# export KUBE_PS1_NS_ENABLE=false
# export KUBE_PS1_PREFIX="<"
# export KUBE_PS1_SUFFIX=">"
# export KUBE_PS1_CLUSTER_FUNCTION=_get_cluster_short

# Plugin settings - AWS
export SHOW_AWS_PROMPT=false
#export AWS_PS1_PROFILE_COLOR=cyan

# Terraform advanced config - source_profile, arn ...
export AWS_SDK_LOAD_CONFIG=1

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

alias clrf="perl -pi -e 's/\r/\n/g'"

# Direnv
eval "$(direnv hook zsh)"

# OH MY ZSH begin
ZSH_THEME="sonicradish"
plugins=(git git-flow docker kubectl kops terraform mix aws kube-ps1)
source $ZSH/oh-my-zsh.sh

# SHOW AWS and Kube context in PS1
# RPROMPT='$(kube_ps1)$(_aws_profile_info)'$RPROMPT

# Load fzf
source ~/.fzf.zsh

# Load Krew (kubectl plugins)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Load ASDF path & completions
export PATH=$PATH:$HOME/.asdf/bin
source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
