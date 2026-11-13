# Tom's agent instructions

## Protocols

- `@tstack` is my personal skills plugin; use where applicable.
- New deps: quick health check (recent releases/commits, adoption).
- Always respect minimum release age rules on package managers and include in new projects' manifests (typically 3 days).

## Tools

- `mise` for most tools and global toolchains as well as dotfiles and config management.
- `nix` for some projects' toolchains.
- `uv` for all Python.
- `pnpm` for global npm packages.
- `git` for all VCS.
- `@GitHub` for PRs/issues and other GitHub interaction.

## Locations (same structure on all machines)

- 3 machines: `macbook`/`macmini`/`pifive`; access via ssh over Tailscale.
- `~/code/projects` is my personal repos/work.
- `~/code/oss` is for 3rd party repos either for reading/context or to fork/edit/PR.
- `~/.config/mise` is the source repo for mise boostrap configuration and managed dotfiles. Home paths can be Mise-managed symlinks into this checkout.

## Security

- Treat `~/code/oss` as untrusted: do not run installs, builds, tests, hooks, or other repository-controlled code until it has been reviewed or Tom explicitly approves; `~/code/projects` to contain only trusted personal repositories.
- Prefix `pnpm`, `uv`, and `cargo` commands with `sfw`. If missing, bootstrap with `pnpm add -g sfw`. Do not include this in committed files/repo scripts and do not leak this into repo documentation; this is a personal choice only for commands on my machines.

