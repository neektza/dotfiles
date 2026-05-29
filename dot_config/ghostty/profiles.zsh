# Ghostty profile helpers. Sourced from ~/.zshrc.

# Open a NEW Ghostty window with the given profile.
# The profile config sets theme = dark:NAME-dark,light:NAME so the window
# auto-switches with macOS appearance.
# Usage: gop secondary
gop() {
  local name="${1:-primary}"
  local f="$HOME/.config/ghostty/profiles/$name.conf"
  if [[ ! -f "$f" ]]; then
    echo "no such profile: $name" >&2
    echo "available: $(ls $HOME/.config/ghostty/profiles/*.conf 2>/dev/null | xargs -n1 basename | sed 's/\.conf$//' | tr '\n' ' ')"
    return 1
  fi
  open -na Ghostty --args \
    --config-file="$HOME/.config/ghostty/config" \
    --config-file="$f"
}

# Tab-completion for profile names.
_gop_complete() {
  reply=( $(ls $HOME/.config/ghostty/profiles/*.conf 2>/dev/null | xargs -n1 basename | sed 's/\.conf$//') )
}
compctl -K _gop_complete gop
