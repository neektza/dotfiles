#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="$HOME/Library/Android/sdk/platform-tools/:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/postgresql@10/bin:$PATH"
export PGDATA=/usr/local/var/postgres/
export PGDATABASE=postgres
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

unsetopt correct_all

# Some commons
alias viml='LIGHT=1true vim'
alias vimd='vim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'
alias gti='git'

# docker & k8s
alias k='kubectl'
alias dclean='docker ps -a -f status=exited | grep -vi "datacontainer" | tail -n +2 | cut -c1-12 | xargs docker rm -v'
alias dcleanimages='docker images -q -f dangling=true | xargs docker rmi'
alias dcleanvolumes='docker volume ls -q | xargs docker volume rm'

alias resecto="mix ecto.drop && mix ecto.create && mix ecto.migrate && mix run priv/repo/seeds.exs"

alias clrf="perl -pi -e 's/\r/\n/g'"

# SERVERS
alias netstat_osx="lsof -i 4 -P -n"
alias floatingpoint="ssh root@178.62.198.200"

# OH MY ZSH begin
ZSH_THEME="afowler"
plugins=(osx brew tmux git git-flow gem mix docker terraform kubectl helm)
source $ZSH/oh-my-zsh.sh

# load fzf
source ~/.fzf.zsh

# load direnv
eval "$(direnv hook zsh)"

# load denijev awesome tool
# eval "$(denv hook ZSH)"

# # load asdf (extensible version manager)
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/neektza/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/neektza/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/neektza/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/neektza/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export HOMEBREW_GITHUB_API_TOKEN=c10e27e57829d421aab057a6ed54bc63e0b6da1b
