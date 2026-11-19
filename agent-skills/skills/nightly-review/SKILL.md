---
name: nightly-review
description: Review the day's merged changes together and prepare focused, ready-to-merge PRs for clear fixes.
disable-model-invocation: true
---

# Nightly review

Review everything merged into `main` today as a combined whole. Use a swarm of agents to give the changes a second set of eyes, looking for correctness issues, simplifications and missed cleanup. Use `reality-check` to investigate suspected bugs and issues.

For each clear, worthwhile fix, spawn a new worktree thread to make the change and open a PR. Keep PRs focused and independent where practical. Leave each thread available so the user can ask the PR maker questions.

A good PR fixes a real, demonstrable problem with an obvious solution. Its description explains the problem, why the fix is right and how it was verified. The user should be able to read the description, glance at the diff and feel comfortable merging without asking follow-up questions.

If the problem is uncertain, the solution is opinionated, or the change is too broad or complicated to review quickly, don't open a PR. Bring it back to chat with a concise explanation and recommendation instead. Larger fixes are fine when they are still clear and easy to review; size is a signal to scrutinize the change, not a hard limit.

For every PR opened, run `lgtm` in ready-to-merge mode: obtain fresh independent review, address applicable review-bot feedback, ensure required CI and verification pass, and keep watching and iterating until the PR is ready. Do not merge it. If a finding requires a change in approach or a decision from the user, stop and explain it in chat.

The output is the ready PRs and any findings that need the user's judgment. If nothing is worth fixing or discussing, say so.
