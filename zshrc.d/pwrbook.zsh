# pwrbook-specific config

# forward macOS appearance to remote shells via LC_ (picked up by SSH SendEnv LC_*)
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
  export LC_APPEARANCE=dark
else
  export LC_APPEARANCE=light
fi
