#!/bin/zsh

ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PGDATA=/usr/local/var/postgres/
export PGDATABASE=postgres
export LEIN_JAVA_CMD=/usr/local/bin/drip
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# export PIP_REQUIRE_VIRTUALENV=true

export CHARGINGIO_BASE_URL="http://localhost:4000"
export CHARGINGIO_API_KEY="273vl476q7zMpjpIR1ZmxN1v5Td5Ydr5UAVi2XgOMUMTXaGF"
export GOOGLE_CLIENT_ID="430549701498-34t0vhnrs1f41pd1fid000ipvqcr6a0g.apps.googleusercontent.com"
export GOOGLE_CLIENT_SECRET="AoyN5hnS9GkHZmTWAZh4A4zP"
export GUARDIAN_SECRET_KEY="eyJhbGciOiJIUzUxMiJ9.e30.Ihz9-QxiSl_B-8jbT-NO7fMGOzbyRfLfhK9jfaD6hU-nxpam0bTQ4Sy343vvIqgJjFMmWgZ8fwGBbjSuAZCcpw"
export AUTH_TOKEN="token"
export BE_SSO_KEY="keykey"
export BE_SSO_SALT="somethingsalty"
export LISA_API_V2_USERNAME="nikica"
export LISA_API_V2_PASSWORD="password"
export LISA_API_V2_KEY="1253766"
export LISA_SSO_KEY="34rtgf"
export LISA_SSO_SALT="324ergf"
export LOVIIT_USERNAME="clubcollect"
export LOVITT_PASSWORD="c1ubc0113ct"
export LOVIIT_MERCHANT_ID="1253766"
export QRACKAJACK_CLIENT_ID="23redfg"
export QRACKAJACK_API_KEY="3lsdkfjsdlfkj"
export PATH="/Users/neektza/perl5/bin${PATH:+:${PATH}}"; export PATH;
export PERL5LIB="/Users/neektza/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
export PERL_LOCAL_LIB_ROOT="/Users/neektza/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
export PERL_MB_OPT="--install_base \"/Users/neektza/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=/Users/neektza/perl5"; export PERL_MM_OPT;

unsetopt correct_all

# Some commons
alias v='LIGHT=1true vim'
alias m='mvim'
alias ack='ack -r'
alias grep='egrep -i'
alias fs='foreman start'
alias gti='git'

alias resecto="mix ecto.drop && mix ecto.create && mix ecto.migrate && mix run priv/repo/seeds.exs"

alias clrf="perl -pi -e 's/\r/\n/g'"

# SERVERS
alias netstat_osx="lsof -i 4 -P -n"
alias floatingpoint="ssh root@178.62.198.200"

# OH MY ZSH begin
ZSH_THEME="afowler"
plugins=(osx brew tmux git git-flow gem mix cargo rbenv)
source $ZSH/oh-my-zsh.sh

# activate nvm
. ~/.nvm/nvm.sh

# load npm completion
source ~/.npm_completion

# load fzf
source ~/.fzf.zsh

# load exenv
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

