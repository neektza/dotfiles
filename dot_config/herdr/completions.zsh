# Generate completions from this host's herdr before Oh My Zsh runs compinit.
() {
  local herdr_bin="${commands[herdr]}"
  if [[ -z "$herdr_bin" && -x "$HOME/.local/bin/herdr" ]]; then
    herdr_bin="$HOME/.local/bin/herdr"
  fi
  [[ -n "$herdr_bin" ]] || return 0

  local completion_dir="$HOME/.zfunc"
  local completion_file="$completion_dir/_herdr"
  local completion_script
  if [[ ! -s "$completion_file" || "$herdr_bin" -nt "$completion_file" ]]; then
    mkdir -p "$completion_dir" || return 0
    if completion_script="$("$herdr_bin" completion zsh 2>/dev/null)" && [[ -n "$completion_script" ]]; then
      print -r -- "$completion_script" >| "$completion_file"
    fi
  fi
}
