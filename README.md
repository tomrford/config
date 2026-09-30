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

Run `bash /workspace/config/bootstrap-codex.sh` during environment installation or refresh. It installs the shared toolchain, activates the Codex target and links user skills and instructions into this checkout, including a separate `CODEX_HOME` when present. It preserves conflicting user files for review. Application dependencies and services remain part of the environment's installation and startup instructions, rather than this personal baseline.

Publish the prepared environment snapshot to retain tools and symlinks. Task startup only sources `/workspace/.setup/env.sh` and starts services needed for the task; it does not rerun bootstrap. Refreshing this checkout updates linked instructions and skills. Rerun installation when tool requirements change.

## Tool versions

Shared tools retain the existing `latest` declarations, with Node constrained to major version 24. The Codex target pins the six runtimes validated during onboarding; Rust 1.95 matches CAN Trace Viewer's flake. No mise lockfile is enabled by this change.

Use `mise upgrade` for an intentional tool refresh within the declared constraints. Review configuration changes and validate the environment before publishing a new snapshot.
