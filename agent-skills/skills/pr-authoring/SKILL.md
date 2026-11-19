---
name: pr-authoring
description: Write or update a pull request's title and description for review. Use for "open a PR", "write the PR description", "prepare this for review" or "update the PR description". Covers the PR's text, not opening, review or merge.
---

# PR authoring

Write the PR's title and body for a reviewer who already has the diff.

Read the full diff against the target branch and check it matches the agreed scope. Flag debug leftovers, commented-out code, narrating comments and unrelated changes rather than editing them; the surrounding task decides how to fix them.

Use a short scoped title naming the change, such as `Workflow: verify review completion at the current head`.

Write the body with the `work-summary` skill, using `##` headings. Where the repository has a PR template, fill it with the same content. The body becomes the squash commit body, so keep it under about 40 lines, with no SHAs, rebase history or "based on main" preamble. The **Needs from you** section becomes questions reviewers must answer before merging, and is usually empty.

When the diff changes, rewrite the body to match it rather than appending updates.

Finish when the title and body match the final diff. Opening the PR and its draft state belong to the surrounding task; review and merge belong to the `lgtm` skill.
