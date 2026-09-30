#!/usr/bin/env bash
set -euo pipefail
cd /workspace
# Run during Codex environment installation/refresh, not every task.
root=/workspace/.setup
mkdir -p "$root/bin" "$root/logs" "$root/cache" "$root/data"
export MISE_ENV=codex
export MISE_DATA_DIR="$root/mise" MISE_CACHE_DIR="$root/cache/mise"
export XDG_CACHE_HOME="$root/cache" XDG_DATA_HOME="$root/data"
export npm_config_cache="$root/cache/npm" PNPM_CONFIG_STORE_DIR="$root/pnpm-store"
export PNPM_HOME="$root/bin" NODE_USE_ENV_PROXY=1 CI=true
export PATH="$root/bin:$root/bin/bin:$PATH"
link() {
  local source=$1 target=$2
  mkdir -p "$(dirname "$target")"
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then return; fi
  if [[ -e "$target" || -L "$target" ]]; then
    printf 'Existing configuration needs review: %s\n' "$target" >&2
    return 1
  fi
  ln -s "$source" "$target"
}
if [[ ! -x "$root/bin/mise" ]]; then
  curl --fail --location https://mise.run -o "$root/mise-install.sh"
  MISE_VERSION=2026.9.17 MISE_INSTALL_PATH="$root/bin/mise" sh "$root/mise-install.sh"
fi
# Migrate only the known symlink created by the earlier onboarding setup.
if [[ -L "$HOME/.config/mise/config.toml" && "$(readlink "$HOME/.config/mise/config.toml")" == /workspace/config/config.sandbox.toml ]]; then
  unlink "$HOME/.config/mise/config.toml"
fi
link /workspace/config/config.toml "$HOME/.config/mise/config.toml"
link /workspace/config/config.codex.toml "$HOME/.config/mise/config.codex.toml"
link /workspace/config/miserc.toml "$HOME/.config/mise/miserc.toml"
link /workspace/config/tasks "$HOME/.config/mise/tasks"
mise trust "$HOME/.config/mise/config.toml"
mise trust "$HOME/.config/mise/config.codex.toml"
# Load the shared baseline plus Codex overrides; macOS hooks are not selected.
mise bootstrap -y
cat > "$root/env.sh" <<'ENV'
export MISE_ENV=codex
export MISE_DATA_DIR=/workspace/.setup/mise
export MISE_CACHE_DIR=/workspace/.setup/cache/mise
export PATH=/workspace/.setup/bin:$PATH
eval "$(/workspace/.setup/bin/mise -C /workspace env -s bash)"
export PATH="$MISE_DATA_DIR/shims:$PATH"
ENV
source "$root/env.sh"
link /workspace/config/.codex/AGENTS.md "${CODEX_HOME:-$HOME/.codex}/AGENTS.md"
if [[ -n "${CODEX_HOME:-}" && "$CODEX_HOME" != "$HOME/.codex" ]]; then
  link /workspace/config/.agents/skills "$CODEX_HOME/skills"
fi
# Login and interactive shells activate the retained baseline without reinstalling.
activation='[ ! -f /workspace/.setup/env.sh ] || . /workspace/.setup/env.sh'
if ! rg -Fqx "$activation" "$HOME/.bashrc"; then
  python - "$HOME/.bashrc" "$activation" <<'PYTHON'
import pathlib, sys
p = pathlib.Path(sys.argv[1])
p.write_text(sys.argv[2] + "\n" + p.read_text())
PYTHON
fi
mise bootstrap status
