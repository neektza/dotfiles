# Dotfiles

Shared [chezmoi](https://www.chezmoi.io/) dotfiles for `pwrbook` (macOS) and
`hermes-v2` (Linux).

## Config locations

Use each application's native config location. Prefer `dot_config/<app>/`
when the app automatically reads `~/.config/<app>/`; avoid environment
overrides, wrapper commands, or compatibility symlinks just to relocate configs.

Chezmoi maps `dot_` to a leading dot and renders `.tmpl` files before deployment.

| Application | Source in this repo | Native destination |
| --- | --- | --- |
| [Git](https://git-scm.com/docs/git-config#FILES) | `dot_config/git/config.tmpl` | `~/.config/git/config` |
| [tmux](https://github.com/tmux/tmux/blob/master/tmux.1) | `dot_config/tmux/tmux.conf.tmpl` | `~/.config/tmux/tmux.conf` |
| [Neovim](https://neovim.io/doc/user/starting/#standard-path) | `dot_config/nvim/init.lua` | `~/.config/nvim/init.lua` |
| [Ghostty](https://ghostty.org/docs/config) | `dot_config/ghostty/config` | `~/.config/ghostty/config` |
| [Zellij](https://zellij.dev/documentation/configuration.html) | `dot_config/zellij/config.kdl` | `~/.config/zellij/config.kdl` |
| [herdr](https://herdr.dev/tui/docs/configuration/) | `dot_config/herdr/config.toml.tmpl` | `~/.config/herdr/config.toml` |
| [Hermes Agent](https://hermes-agent.nousresearch.com/docs/user-guide/features/skins) | `dot_hermes/skins/adaptive.yaml` | `~/.hermes/skins/adaptive.yaml` |

All six `dot_config` applications discover these locations without custom path
mappings. Ghostty and Zellij support these paths on macOS as well as Linux,
alongside their macOS Application Support locations. Ghostty's current docs
prefer `config.ghostty`, but the tracked `config` filename remains supported.

Hermes Agent is separate from herdr and natively uses `~/.hermes/`, which is why
its files use `dot_hermes/`. Likewise, zsh, Vim, psql, and ack keep their native
home-directory dotfiles at the repo's top level.

`.chezmoiignore` restricts Ghostty's main config to `pwrbook`, and Zellij's config
to `pwrbook` and `hermes-v2`. `.chezmoiremove` removes the old home-directory Git
and tmux configs after their migration to the native XDG paths.

## Helpers and exceptions

Git aliases explicitly source `git/helpers.sh`; tmux sources `tmux/tmuxline.conf`.
The zsh config sources the herdr and Zellij completion loaders and the legacy
Ghostty theme helper. These are custom helper files, not config-path redirects.

Neovim currently overrides its undo directory to `~/.config/nvim/tmp/undo` in
`dot_config/nvim/lua/options.lua`. A future cleanup should restore its native
state directory (`~/.local/state/nvim/undo` by default) while retaining persistent
undo history.
