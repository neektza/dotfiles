# Ghostty theme helpers. Sourced from ~/.zshrc.

_ghostty_themes_dir="$HOME/.config/ghostty/themes"

# List available themes stripped of context suffix.
gth-list() {
  echo "dark\nlight"
}

# Repaint the CURRENT terminal window via OSC sequences.
# On pwrbook: gth dark/light repaints to the local named theme's colors.
# On hermes:  gth dark → Chester, gth light → Kanso Pearl (hardcoded, no files needed).
gth() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: gth dark|light"
    return 1
  fi

  # resolve contextual name
  local resolved="$name"
  if [[ -n "$GTH_CONTEXT" ]]; then
    local cf="$_ghostty_themes_dir/${name}-${GTH_CONTEXT}.conf"
    [[ -f "$cf" ]] && resolved="${name}-${GTH_CONTEXT}"
  fi

  local f="$_ghostty_themes_dir/${resolved}.conf"

  if [[ -f "$f" ]]; then
    _gth_send_file "$f"
  else
    _gth_send_builtin "$name"
  fi
}

_gth_send_file() {
  local f="$1"
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

_gth_send_builtin() {
  local name="$1"
  local esc=$'\033' bel=$'\007'
  case "$name" in
    dark)
      # Chester
      printf "%s]4;0;#080200%s"  "$esc" "$bel"; printf "%s]4;1;#fa5e5b%s"  "$esc" "$bel"
      printf "%s]4;2;#16c98d%s"  "$esc" "$bel"; printf "%s]4;3;#ffc83f%s"  "$esc" "$bel"
      printf "%s]4;4;#288ad6%s"  "$esc" "$bel"; printf "%s]4;5;#d34590%s"  "$esc" "$bel"
      printf "%s]4;6;#28ddde%s"  "$esc" "$bel"; printf "%s]4;7;#e7e7e7%s"  "$esc" "$bel"
      printf "%s]4;8;#6f6b68%s"  "$esc" "$bel"; printf "%s]4;9;#fa5e5b%s"  "$esc" "$bel"
      printf "%s]4;10;#16c98d%s" "$esc" "$bel"; printf "%s]4;11;#feef6d%s" "$esc" "$bel"
      printf "%s]4;12;#278ad6%s" "$esc" "$bel"; printf "%s]4;13;#d34590%s" "$esc" "$bel"
      printf "%s]4;14;#27dede%s" "$esc" "$bel"; printf "%s]4;15;#ffffff%s" "$esc" "$bel"
      printf "%s]11;#2c3643%s" "$esc" "$bel"   # background
      printf "%s]10;#ffffff%s" "$esc" "$bel"   # foreground
      printf "%s]12;#b4b1b1%s" "$esc" "$bel"   # cursor
      printf "%s]17;#67747c%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#ffffff%s" "$esc" "$bel"   # selection-foreground
      ;;
    light)
      # Kanso Pearl
      printf "%s]4;0;#22262d%s"  "$esc" "$bel"; printf "%s]4;1;#c84053%s"  "$esc" "$bel"
      printf "%s]4;2;#6f894e%s"  "$esc" "$bel"; printf "%s]4;3;#77713f%s"  "$esc" "$bel"
      printf "%s]4;4;#4d699b%s"  "$esc" "$bel"; printf "%s]4;5;#b35b79%s"  "$esc" "$bel"
      printf "%s]4;6;#597b75%s"  "$esc" "$bel"; printf "%s]4;7;#545464%s"  "$esc" "$bel"
      printf "%s]4;8;#6d6f6e%s"  "$esc" "$bel"; printf "%s]4;9;#d7474b%s"  "$esc" "$bel"
      printf "%s]4;10;#6e915f%s" "$esc" "$bel"; printf "%s]4;11;#836f4a%s" "$esc" "$bel"
      printf "%s]4;12;#6693bf%s" "$esc" "$bel"; printf "%s]4;13;#624c83%s" "$esc" "$bel"
      printf "%s]4;14;#5e857a%s" "$esc" "$bel"; printf "%s]4;15;#43436c%s" "$esc" "$bel"
      printf "%s]11;#f2f1ef%s" "$esc" "$bel"   # background
      printf "%s]10;#22262d%s" "$esc" "$bel"   # foreground
      printf "%s]12;#22262d%s" "$esc" "$bel"   # cursor
      printf "%s]17;#e2e1df%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#22262d%s" "$esc" "$bel"   # selection-foreground
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
