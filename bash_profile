#!/bin/bash

# Some commons
alias ll='ls -lah'
export EDITOR=vim

# Load RBenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
