#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH=$PATH:$HOME/bin
export PATH=/Applications/Docker.app/Contents/Resources/bin:$PATH

export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export SSH_AUTH_SOCK=~/.1password/agent.sock
export PGDATABASE=postgres
export LESS='-R --mouse'

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
plugins=(git fzf asdf brew docker terraform pip poetry npm node gem bundler)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/neektza/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
