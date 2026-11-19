# Tom's agent instructions

## Protocols

- New deps: quick health check (recent releases/commits, adoption).
- Always respect minimum release age rules on package managers and include in new projects' manifests (typically 3 days).

## Tools

- `mise` for most tools and global toolchains as well as dotfiles and config management.
- `nix` for some projects' toolchains.
- `uv` for all Python.
- `bun` for JS/TS projects and global npm packages.
- `git` for all VCS.
- `gh` for PRs/issues and other GitHub interaction.
- `cf` for Cloudflare API interactions and managing deployments (if missing, `bun add -g cf` and ask me to auth).

## Locations (same structure on all machines)

- 3 machines: `macbook`/`macmini`/`pifive`; access via ssh over Tailscale.
- `~/code/projects` is my personal repos/work.
- `~/.config/mise` is the source repo for mise boostrap configuration and managed dotfiles. Home paths can be Mise-managed symlinks into this checkout.

