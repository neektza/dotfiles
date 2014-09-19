#!/bin/bash

# Some commons
alias m='mvim'
alias ll='ls -lah'
export EDITOR=vim

# Load RBenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
