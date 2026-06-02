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

  # write hint for nvim (OSC 11 doesn't survive mosh)
  echo "$name" > ~/.background_hint
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
      # Earthsong
      printf "%s]4;0;#121418%s"  "$esc" "$bel"; printf "%s]4;1;#c94234%s"  "$esc" "$bel"
      printf "%s]4;2;#85c54c%s"  "$esc" "$bel"; printf "%s]4;3;#f5ae2e%s"  "$esc" "$bel"
      printf "%s]4;4;#1398b9%s"  "$esc" "$bel"; printf "%s]4;5;#d0633d%s"  "$esc" "$bel"
      printf "%s]4;6;#509552%s"  "$esc" "$bel"; printf "%s]4;7;#e5c6aa%s"  "$esc" "$bel"
      printf "%s]4;8;#675f54%s"  "$esc" "$bel"; printf "%s]4;9;#ff645a%s"  "$esc" "$bel"
      printf "%s]4;10;#98e036%s" "$esc" "$bel"; printf "%s]4;11;#e0d561%s" "$esc" "$bel"
      printf "%s]4;12;#5fdaff%s" "$esc" "$bel"; printf "%s]4;13;#ff9269%s" "$esc" "$bel"
      printf "%s]4;14;#84f088%s" "$esc" "$bel"; printf "%s]4;15;#f6f7ec%s" "$esc" "$bel"
      printf "%s]11;#292520%s" "$esc" "$bel"   # background
      printf "%s]10;#e5c7a9%s" "$esc" "$bel"   # foreground
      printf "%s]12;#f6f7ec%s" "$esc" "$bel"   # cursor
      printf "%s]17;#121418%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#e5c7a9%s" "$esc" "$bel"   # selection-foreground
      ;;
    light)
      # Ayu Light
      printf "%s]4;0;#000000%s"  "$esc" "$bel"; printf "%s]4;1;#ea6c6d%s"  "$esc" "$bel"
      printf "%s]4;2;#6cbf43%s"  "$esc" "$bel"; printf "%s]4;3;#eca944%s"  "$esc" "$bel"
      printf "%s]4;4;#3199e1%s"  "$esc" "$bel"; printf "%s]4;5;#9e75c7%s"  "$esc" "$bel"
      printf "%s]4;6;#46ba94%s"  "$esc" "$bel"; printf "%s]4;7;#bababa%s"  "$esc" "$bel"
      printf "%s]4;8;#686868%s"  "$esc" "$bel"; printf "%s]4;9;#f07171%s"  "$esc" "$bel"
      printf "%s]4;10;#86b300%s" "$esc" "$bel"; printf "%s]4;11;#f2ae49%s" "$esc" "$bel"
      printf "%s]4;12;#399ee6%s" "$esc" "$bel"; printf "%s]4;13;#a37acc%s" "$esc" "$bel"
      printf "%s]4;14;#4cbf99%s" "$esc" "$bel"; printf "%s]4;15;#d1d1d1%s" "$esc" "$bel"
      printf "%s]11;#f8f9fa%s" "$esc" "$bel"   # background
      printf "%s]10;#5c6166%s" "$esc" "$bel"   # foreground
      printf "%s]12;#ffaa33%s" "$esc" "$bel"   # cursor
      printf "%s]17;#035bd6%s" "$esc" "$bel"   # selection-background
      printf "%s]19;#f8f9fa%s" "$esc" "$bel"   # selection-foreground
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
