# Ghostty theme helpers. Sourced from ~/.zshrc.

_ghostty_themes_dir="$HOME/.config/ghostty/themes"

# List available themes (strips it- prefix, context suffix, and .conf for display).
gth-list() {
  ls -1 "$_ghostty_themes_dir"/it-*.conf 2>/dev/null \
    | xargs -n1 basename \
    | sed 's/^it-//; s/\.conf$//' \
    | sed "s/-${GTH_CONTEXT}$//" \
    | sort -u
}

# Repaint the CURRENT terminal window using a theme file via OSC sequences.
# If the exact theme file doesn't exist and GTH_CONTEXT is set, appends context
# automatically: gth dark → it-dark-local.conf or it-dark-remote.conf
gth() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: gth <theme>   themes: $(gth-list | tr '\n' ' ')"
    return 1
  fi
  local f="$_ghostty_themes_dir/it-$name.conf"
  if [[ ! -f "$f" && -n "$GTH_CONTEXT" ]]; then
    name="${name}-${GTH_CONTEXT}"
    f="$_ghostty_themes_dir/it-$name.conf"
  fi
  if [[ ! -f "$f" ]]; then
    echo "no such theme: $1" >&2
    return 1
  fi
  local esc=$'\033' bel=$'\007'
  local key val
  while IFS= read -r line; do
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${line// /}" ]] && continue
    key="${line%%=*}"; val="${line#*=}"
    key="${key// /}"; val="${val// /}"
    case "$key" in
      palette)
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

# Tab-completion for theme names.
_gth_complete() { reply=( $(gth-list) ); }
compctl -K _gth_complete gth
