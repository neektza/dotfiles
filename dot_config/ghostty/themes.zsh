# Ghostty theme helpers. Sourced from ~/.zshrc.

# List available themes stripped of context suffix.
gth-list() {
  echo "dark\nlight"
}

# Repaint the CURRENT terminal window via OSC sequences.
# Unified to Gruvbox Dark and Gruvbox Light everywhere.
gth() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: gth dark|light"
    return 1
  fi

  _gth_send_builtin "$name"

  # write hint for nvim (OSC 11 doesn't survive mosh)
  echo "$name" > ~/.background_hint
}

_gth_send_builtin() {
  local name="$1"
  local esc=$'\033' bel=$'\007'
  case "$name" in
    dark)
      # Gruvbox Dark
      printf "%s]4;0;#282828%s"  "$esc" "$bel"; printf "%s]4;1;#cc241d%s"  "$esc" "$bel"
      printf "%s]4;2;#98971a%s"  "$esc" "$bel"; printf "%s]4;3;#d79921%s"  "$esc" "$bel"
      printf "%s]4;4;#458588%s"  "$esc" "$bel"; printf "%s]4;5;#b16286%s"  "$esc" "$bel"
      printf "%s]4;6;#689d6a%s"  "$esc" "$bel"; printf "%s]4;7;#a89984%s"  "$esc" "$bel"
      printf "%s]4;8;#928374%s"  "$esc" "$bel"; printf "%s]4;9;#fb4934%s"  "$esc" "$bel"
      printf "%s]4;10;#b8bb26%s" "$esc" "$bel"; printf "%s]4;11;#fabd2f%s" "$esc" "$bel"
      printf "%s]4;12;#83a598%s" "$esc" "$bel"; printf "%s]4;13;#d3869b%s" "$esc" "$bel"
      printf "%s]4;14;#8ec07c%s" "$esc" "$bel"; printf "%s]4;15;#ebdbb2%s" "$esc" "$bel"
      printf "%s]11;#282828%s" "$esc" "$bel"   # background
      printf "%s]10;#ebdbb2%s" "$esc" "$bel"   # foreground
      printf "%s]12;#ebdbb2%s" "$esc" "$bel"   # cursor
      printf "%s]17;#504945%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#ebdbb2%s" "$esc" "$bel"   # selection-foreground
      ;;
    light)
      # Gruvbox Light
      printf "%s]4;0;#fbf1c7%s"  "$esc" "$bel"; printf "%s]4;1;#cc241d%s"  "$esc" "$bel"
      printf "%s]4;2;#98971a%s"  "$esc" "$bel"; printf "%s]4;3;#d79921%s"  "$esc" "$bel"
      printf "%s]4;4;#458588%s"  "$esc" "$bel"; printf "%s]4;5;#b16286%s"  "$esc" "$bel"
      printf "%s]4;6;#689d6a%s"  "$esc" "$bel"; printf "%s]4;7;#7c6f64%s"  "$esc" "$bel"
      printf "%s]4;8;#928374%s"  "$esc" "$bel"; printf "%s]4;9;#fb4934%s"  "$esc" "$bel"
      printf "%s]4;10;#b8bb26%s" "$esc" "$bel"; printf "%s]4;11;#fabd2f%s" "$esc" "$bel"
      printf "%s]4;12;#83a598%s" "$esc" "$bel"; printf "%s]4;13;#d3869b%s" "$esc" "$bel"
      printf "%s]4;14;#8ec07c%s" "$esc" "$bel"; printf "%s]4;15;#3c3836%s" "$esc" "$bel"
      printf "%s]11;#fbf1c7%s" "$esc" "$bel"   # background
      printf "%s]10;#3c3836%s" "$esc" "$bel"   # foreground
      printf "%s]12;#3c3836%s" "$esc" "$bel"   # cursor
      printf "%s]17;#d5c4a1%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#3c3836%s" "$esc" "$bel"   # selection-foreground
      ;;
    *)
      echo "no such theme: $name" >&2
      return 1
      ;;
  esac
}

# Tab-completion for theme names.
_gth_complete() { reply=(dark light); }
compctl -K _gth_complete gth
