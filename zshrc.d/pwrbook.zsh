# pwrbook-specific config

# forward macOS appearance to remote shells via LC_ (picked up by SSH SendEnv LC_*)
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
  export LC_APPEARANCE=dark
else
  export LC_APPEARANCE=light
fi

# zoxide: smart cd with frecency (zi for interactive picker)
# install with: brew install zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
