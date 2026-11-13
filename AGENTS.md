# Dotfiles Repo — Agent Guidance

This is a [chezmoi](https://chezmoi.io) dotfiles repo. Chezmoi maps source filenames to destination paths using prefixes.

## Chezmoi naming conventions

- `dot_foo` → `~/.foo`
- `dot_foo.tmpl` → `~/.foo` (processed as a Go template)
- `private_dot_foo` → `~/.foo` with 700 permissions
- Plain files/dirs (no `dot_` prefix) are NOT deployed — they're repo-only

## Machines

| Hostname   | OS    | Description         |
|------------|-------|---------------------|
| pwrbook    | macOS | primary workstation |
| hermes-v2  | Linux | VPS / server        |

Templates use `{{ .chezmoi.hostname }}` and `{{ .chezmoi.os }}` for per-host/per-OS branching.

## Key files

- `dot_zshrc.tmpl` — main zsh config, templated for OS and hostname
- `zshrc.d/<hostname>.zsh` — per-host zsh config, sourced at end of `.zshrc` by hostname
- `dot_config/tmux/tmux.conf.tmpl` — tmux config
- `dot_config/tmux/tmuxline.conf` — tmux status bar
- `dot_config/git/config.tmpl` — git config with templated user identity
- `dot_config/git/helpers.sh` — shell helpers used by Git aliases

## Config layout

Prefer `dot_config/<app>/` when the app natively reads `~/.config/<app>/`.
Git and tmux use this layout alongside Neovim, Ghostty, Zellij, and herdr.
Keep files such as `dot_zshrc.tmpl`, `dot_vimrc`, `dot_psqlrc`, and `dot_ackrc`
at the top level because their apps expect home-directory dotfiles by default.
`.chezmoiremove` removes the old Git and tmux paths when applying this migration.

## Per-host zsh config

`dot_zshrc.tmpl` sources `$DOTFILES/zshrc.d/$(hostname).zsh` at the end if the file exists. Add a new file to `zshrc.d/` named after the hostname to add machine-specific config. These files are NOT deployed by chezmoi — they live in the repo and are sourced directly.

## chezmoi is not installed on all machines

hermes-v2 has chezmoi installed at `~/.local/bin/chezmoi`. Apply changes with:
```
chezmoi apply --force
```

## What is NOT tracked

- `~/.claude/` — Claude Code config (managed separately)

## Themes

Terminal theme selection belongs on pwrbook: Ghostty and the local herdr client.
Herdr connects to Hermes as a saved remote machine. Do not add remote palette
switching or require Ghostty and Zellij theme names to match.

Current Ghostty themes: dark=Gruvbox Dark, light=Gruvbox Light. A higher-contrast
light theme has been researched but has not been selected or applied yet.
Verify available Ghostty themes on the Mac with `ghostty +list-themes`.
Legacy `themes.zsh` helpers and appearance forwarding are still present;
their cleanup belongs to the planned local-theme migration.

## Conditional deployment

- `~/.config/zellij/` — deployed on hermes-v2 and pwrbook, ignored on other hosts via `.chezmoiignore`
- `~/.config/ghostty/config` — deployed only on pwrbook (macOS); legacy helpers are still shared
