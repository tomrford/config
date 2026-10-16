# Tom's agent instructions

## Protocols

- New deps: quick health check (recent releases/commits, adoption).
- Respect minimum release age rules on package managers (typically 3 days).
- Commit messages: Scoped over Conventional.
- Merges/PR close: prefer squash.
- keep remote in sync with local by default (i.e. fetch and prune, push when committed).
- Delete dead files; do not leave stub modules.
- Do not preserve backwards compatibility unless explicitly requested.
- File drift over ~1000 LOC should be justified; split/refactor when appropriate and complexity doesn't suffer.

## Tools

- `mise` for most tools and global toolchains as well as dotfiles and config management.
- `nix` for some projects or one-off tooling requirements.
- `uv` for all Python.
- `pnpm` for global npm packages.
- `@GitHub` and/or `gh` for PRs/issues and other GitHub interaction.

## Locations (same structure on all machines)

- 3 machines: `macbook`/`macmini`/`pifive`; access via ssh over Tailscale => use `tailscale status` for hosts/IPs.
- Generally all software development work lives in `~/code`.
- `~/code/projects` is my personal repos/work.
- `~/code/oss` is for 3rd party repos either for reading/context or to fork/edit/PR.
- `~/.config/mise` is the source repo for mise boostrap configuration and managed dotfiles. Home paths can be Mise-managed symlinks into this checkout.

## Security

- Treat `~/code/oss` as untrusted: do not run installs, builds, tests, hooks, or other repository-controlled code until it has been reviewed or Tom explicitly approves; `~/code/projects` to contain only trusted personal repositories.
- On local machines, prefix `pnpm`, `uv`, and `cargo` commands with `sfw`. If missing, bootstrap with `pnpm add -g sfw`. Do not include these prefixes in committed files/repo scripts. In Codex cloud environments, use the platform egress proxy directly; `sfw` cannot route downloads through it.

