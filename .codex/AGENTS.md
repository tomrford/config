# Tom's agent instructions

## Protocols

- New deps: quick health check (recent releases/commits, adoption).
- Respect minimum release age rules on package managers (typically 3 days).

## Tools

- `mise` for most tools and global toolchains as well as dotfiles and config management.
- `uv` for all Python.
- `pnpm` for global npm packages.
- `@GitHub` for PRs/issues and other GitHub interaction.

## Locations (same structure on all machines)

- 2 machines: `macbook`/`macmini`; access via ssh over Tailscale.
- `~/code/projects` is my personal repos/work.
- `~/code/oss` is for 3rd party repos either for reading/context or to fork/edit/PR.
- `~/.config/mise` is the source repo for mise boostrap configuration and managed dotfiles. Home paths can be Mise-managed symlinks into this checkout.

## Security

- Treat `~/code/oss` as untrusted: do not run installs, builds, tests, hooks, or other repository-controlled code until it has been reviewed or Tom explicitly approves; `~/code/projects` to contain only trusted personal repositories.
- On local machines, prefix `pnpm`, `uv`, and `cargo` commands with `sfw`. If missing, bootstrap with `pnpm add -g sfw`. Do not include these prefixes in committed files/repo scripts. In Codex cloud environments, use the platform egress proxy directly; `sfw` cannot route downloads through it.

