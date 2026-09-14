---
name: clean-slate
description: For user invocation only to prepare the repo.
---

Fetch the latest copy of the repo using --prune, check and delete local branches that have merged, and move the checkout to the tip of main to begin working. Pause any task if there are uncommitted changes and inform the user; do not stash or start a git worktree elsewhere.
