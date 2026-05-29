# Zellij aliases and zsh completions. Sourced from ~/.zshrc.

if ! command -v zellij &>/dev/null; then return; fi

alias za='zellij attach'
alias zl='zellij list-sessions'
alias zk='zellij kill-session'
alias zka='zellij kill-all-sessions'
alias zd='zellij delete-session'
alias zda='zellij delete-all-sessions'
alias zw='zellij watch'

# generate completion file once (regenerate if zellij binary is newer)
_zellij_comp_file="${HOME}/.zfunc/_zellij"
if [[ ! -f "$_zellij_comp_file" || "$(command -v zellij)" -nt "$_zellij_comp_file" ]]; then
  mkdir -p "${HOME}/.zfunc"
  zellij setup --generate-completion zsh >! "$_zellij_comp_file" 2>/dev/null
  # patch: wire all session-name positional args to live session lookup
  sed -i 's/::session-name -- Name of the session to attach to:/::session-name -- Name of the session to attach to:_zellij_sessions/' "$_zellij_comp_file"
  sed -i 's/::session-name -- Name of the session to watch:/::session-name -- Name of the session to watch:_zellij_sessions/' "$_zellij_comp_file"
  sed -i 's/::target-session -- Name of target session:/::target-session -- Name of target session:_zellij_sessions/' "$_zellij_comp_file"
  sed -i 's/:name -- Name of the session to switch to:/:name -- Name of the session to switch to:_zellij_sessions/' "$_zellij_comp_file"
  sed -i '/":: :_zellij__attach_commands"/d' "$_zellij_comp_file"
fi

# live session name completion
_zellij_sessions() {
  local sessions
  sessions=(${(f)"$(zellij list-sessions 2>/dev/null | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')"})
  _describe 'sessions' sessions
}
_zellij_session_cmd() { _arguments '1:session:_zellij_sessions' }
compdef _zellij_session_cmd za zk zd zw
