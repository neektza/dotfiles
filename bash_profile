#!/bin/bash

# Some commons
alias 'ack' = 'ack -ri'

#########
# RAILS #
#########
alias '_last_migration' = 'echo db/migrate/`ls -Atr db/migrate/ | tail -1 `'

###########
# SERVERS #
###########
alias 'met-store-box' = 'ssh storestaging@store.meteor.ie'
alias 'met-ie-box' = 'ssh meteor@meteor-sandbox.rubylithcms.com'

##############
# Load RBenv #
##############
export PATH="$HOME/.rbenv/bin:$PATH"
