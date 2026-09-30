# Config

Shared mise toolchains, dotfiles and agent configuration for my machines and Codex environments.

## Targets

- `config.toml` contains shared tools, agent links and settings.
- `config.macos.toml` contains Homebrew packages, desktop dotfiles and the macOS login shell.
- `config.codex.toml` contains Codex tool-version overrides, writable caches and platform proxy settings.
- `miserc.toml` selects the host OS as the default environment. Macs load `config.macos.toml`; Codex explicitly selects `MISE_ENV=codex`. Other hosts load the shared baseline unless their target is configured.

On Macs, keep this checkout at `~/.config/mise`, update mise, then preview and apply:

```sh
mise bootstrap --dry-run
mise bootstrap
```

To explicitly select a target, use `mise -E macos bootstrap` or `mise -E codex bootstrap`. The Codex target uses `/workspace` paths and is intended for the Codex Linux environment.

## Codex installation

Use this whole checkout as `~/.config/mise`, just as on macOS. Codex environment installation links that directory to `/workspace/config` so repository refreshes are visible immediately, installs mise if needed, then runs:

```sh
mise trust ~/.config/mise/config.toml
mise trust ~/.config/mise/config.codex.toml
mise -E codex bootstrap
```

Mise manages the skill and AGENTS.md links, shell activation and the environment initialisation file that selects the Codex target. The target also links the platform's runtime instructions under `/run/codex-environment/codex-home`. Application dependencies and services remain in the environment installation and startup instructions.

Publish the prepared environment snapshot to retain tools and symlinks. Task startup uses the managed shell configuration and starts only the services it needs; it does not rerun bootstrap. Refreshing the checkout updates linked instructions and skills. Rerun bootstrap when configuration requirements change.

## Tool versions

Shared tools retain the existing `latest` declarations, with Node constrained to major version 24. The Codex target overrides only Rust to 1.95, matching CAN Trace Viewer's flake while Nix is unavailable. All other tools use the same declarations as macOS. No mise lockfile is enabled by this change.

Use `mise upgrade` for an intentional tool refresh within the declared constraints. Review configuration changes and validate the environment before publishing a new snapshot.
