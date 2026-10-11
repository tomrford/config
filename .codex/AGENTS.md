# Tom's agent instructions

## Tools

- `mise` is used for most tools and global toolchains as well as dotfile and config management.
- `nix` is often used for toolchains => `nix develop -c` to run commands.
- `uv` for all Python => `uv run`, `uv venv`, `uv format`.
- `pnpm` for global npm packages.
- `trash` for deletes when available.
- `op` 1password CLI for personal credentials (no service account so requires human auth).
- `grepo` for managing external context within a repo; use `grepo skill` for usage.
- `mise run papercut 'message'` for logging addressable friction (flaky command, missed tool call, confusing or undocumented step) locally for later. One or two sentences explaining what you were doing and what got in the way. Do this proactively in the moment.

## Codex Specific Plugins

- `@tstack` for workflows for any significant piece of work.
- `@GitHub` for PRs/issues and other GitHub interaction.
- `@Browser` as the default for dev servers and development.
- `@Chrome` drives Helium as a fallback for @Browser/for logged in access.
- `@Computer` for non-browser and/or a last resort for failures in the above 2 plugins.

## Locations (same structure on all machines)

- 3 machines: `macbook`/`macmini`/`pifive`; access via ssh over Tailscale => use `tailscale status` for hosts/IPs.
- Generally all software development work lives in `~/code`.
- `~/code/projects` is my personal repos/work.
- `~/code/oss` is for 3rd party repos either for reading/context or to fork/edit/PR.
- `~/.config/mise` is the source repo for mise boostrap configuration and managed dotfiles. Home paths can be Mise-managed symlinks into this checkout.

## Security

- Treat `~/code/oss` as untrusted: do not run installs, builds, tests, hooks, or other repository-controlled code until it has been reviewed or Tom explicitly approves; `~/code/projects` to contain only trusted personal repositories.
- On local machines, prefix `pnpm`, `uv`, and `cargo` commands with `sfw`. If missing, bootstrap with `pnpm add -g sfw`. Do not include these prefixes in committed files/repo scripts. In Codex cloud environments, use the platform egress proxy directly; `sfw` cannot route downloads through it.
- New deps: quick health check (recent releases/commits, adoption).
- Respect minimum release age rules on package managers.

## VCS

- Commit messages: Scoped over Conventional.
- Merges/PR close: prefer squash.
- Prefer repo clone via ssh.
- keep remote in sync with local by default (i.e. fetch and prune, push when committed).

## Repo health

- Delete dead files; do not leave stub modules.
- Do not preserve backwards compatibility unless explicitly requested.
- File drift over ~1000 LOC should be justified; split/refactor when appropriate and complexity doesn't suffer.

## Writing guidance

- Organise content around the task. Give each section/paragraph one topic. Create emphasis through order and structure.
- Define unavoidable jargon on first use. Use exact names, numbers and dates.
- Use sentence case headings and descriptive link text. Use numbered lists only for ordered items.
- Lead with affirmative scope; minimize negative framing.
- Code should be self-documenting; implementation docs live in code rather than markdown sidecars.
- Docs should only reflect current behaviour/contracts; git diff is the place for historical context.
- Make sure each word justifies its existence.
- When writing on my behalf => British English; minimise/drop filler sentences; clear, succinct and to the point.

