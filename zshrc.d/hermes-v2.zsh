# Hermes CLI completions
# Cached: `hermes completion zsh` boots the full agent (incl. ~31 1Password reads),
# so only regenerate when the completion code changes after a `hermes update`.
if command -v hermes >/dev/null 2>&1; then
  _hermes_comp_file="${XDG_CACHE_HOME:-$HOME/.cache}/hermes-completion.zsh"
  _hermes_comp_src="$HOME/.hermes/hermes-agent/hermes_cli/commands_completion.py"
  if [[ ! -s "$_hermes_comp_file" || "$_hermes_comp_src" -nt "$_hermes_comp_file" ]]; then
    hermes completion zsh >| "$_hermes_comp_file" 2>/dev/null
  fi
  source "$_hermes_comp_file"
  unset _hermes_comp_file _hermes_comp_src
fi

# zoxide: smart cd with frecency (zi for interactive picker)
eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"
export PATH=$PATH:$HOME/.hermes/node/bin:$HOME/.local/bin

# PostgreSQL DB Aliases
alias db-tracks='psql "postgresql://postgres:postgres@localhost:5432/vbt_tracks?sslmode=disable"'
alias db-hub='psql "postgresql://hub:hub@localhost:5433/trackframe_hub?sslmode=disable"'

# Systemd Log Aliases
alias logs-tracks='journalctl --user -u vbt-tracks-dev.service -n 100 -f'
alias logs-hub='journalctl --user -u trackframe-hub-api.service -n 100 -f'
alias logs-admin='journalctl --user -u trackframe-hub-admin.service -n 100 -f'

# Color hostname golden (override zsh theme prompt)
PROMPT="%F{178}%m%f${PROMPT#%m}"

# Disable alternate scroll mode — prevents Ghostty from converting scroll wheel to arrow keys
printf '\e[?1007l'
