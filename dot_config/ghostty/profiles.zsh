# Ghostty profile helpers. Sourced from ~/.zshrc.

_ghostty_themes_dir="$HOME/.config/ghostty/themes"

# List available profiles (strips it- prefix and .conf suffix for display).
gth-list() {
  ls -1 "$_ghostty_themes_dir"/it-*.conf 2>/dev/null | xargs -n1 basename | sed 's/^it-//; s/\.conf$//'
}

# Repaint the CURRENT terminal window using a theme file via OSC sequences.
# Usage: gth secondary
gth() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: gth <profile>   profiles: $(gth-list | tr '\n' ' ')"
    return 1
  fi
  local f="$_ghostty_themes_dir/it-$name.conf"
  if [[ ! -f "$f" ]]; then
    echo "no such profile: $name" >&2
    return 1
  fi
  local esc=$'\033' bel=$'\007'
  local key val
  while IFS= read -r line; do
    # skip blank lines and full-line comments (leading whitespace + #)
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${line// /}" ]] && continue
    key="${line%%=*}"; val="${line#*=}"
    key="${key// /}"; val="${val// /}"
    case "$key" in
      palette)
        # palette = N=#rrggbb
        local idx="${val%%=*}" col="${val##*=}"
        printf "%s]4;%s;%s%s" "$esc" "$idx" "$col" "$bel"
        ;;
      background)            printf "%s]11;%s%s" "$esc" "$val" "$bel" ;;
      foreground)            printf "%s]10;%s%s" "$esc" "$val" "$bel" ;;
      cursor-color)          printf "%s]12;%s%s" "$esc" "$val" "$bel" ;;
      selection-background)  printf "%s]17;%s%s" "$esc" "$val" "$bel" ;;
      selection-foreground)  printf "%s]19;%s%s" "$esc" "$val" "$bel" ;;
    esac
  done < "$f"
}

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
_gth_complete() { reply=( $(gth-list) ); }
compctl -K _gth_complete gth gop
