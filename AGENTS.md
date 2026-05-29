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
- `dot_tmux.conf.tmpl` — tmux config
- `dot_gitconfig.tmpl` — git config with templated user identity

## Per-host zsh config

`dot_zshrc.tmpl` sources `$DOTFILES/zshrc.d/$(hostname).zsh` at the end if the file exists. Add a new file to `zshrc.d/` named after the hostname to add machine-specific config. These files are NOT deployed by chezmoi — they live in the repo and are sourced directly.

## chezmoi is not installed on all machines

hermes-v2 has chezmoi installed at `~/.local/bin/chezmoi`. Apply changes with:
```
chezmoi apply --force
```

## What is NOT tracked

- `~/.config/ghostty/` — Ghostty terminal config (managed separately)
- `~/.config/zellij/` — Zellij config (managed separately)
- `~/.claude/` — Claude Code config (managed separately)
