---
name: work-summary
description: Summarise a change or a stretch of work for someone who didn't watch it happen, covering what changed, scope, decisions, risks, verification and what is needed from them. Use for "tldr", "summarise what you did", handovers, status updates, and the body of a PR description.
---

# Work summary

Write a briefing the reader can act on in about a minute. Lead with the outcome. Describe the final state, not the route to it: leave out chronology and dead ends unless they explain a decision. Long detail belongs in a linked artifact or file.

## Check before writing

Check every claim against the final state: the current diff, the latest check results, and what is actually committed or pushed. Drop claims that went stale as the work changed. Never present a guess as a finding.

## Sections

Use these in order, dropping any with nothing to say:

- **Why**: what the work achieves and the problem it solves, then the approach, in 1–3 sentences.
- **What changed**: 1–3 bullets on the outcome, then the size table when the work produced a diff. Name a symbol or path only when it carries the change, and both sides of a rename.
- **Scope**: what the work covers and what it leaves out or left unfinished. Always make the boundary clear; for a small change, a clause under What changed is enough.
- **Decisions**: choices a reader would otherwise question, with the rejected alternative, including any they may want to reverse.
- **Risks**: 1–2 sentences on what the work could break and why it is safe or risky. Name any safety fact left unproven.
- **Verification**: 1–3 bullets, each a real check and its outcome, saying whether it was run or only inspected. Name gaps and blocked checks. For performance, give one number with its unit, before → after.
- **Needs from you**: pending decisions, approvals and checks only the reader can do, each with what is needed and why.

## Size table

First establish what is being summarised: the commits that belong to this work, plus any staged, unstaged and untracked changes. Count all of it, for example with `git diff --numstat <start>`, where `<start>` is the commit just before this work, for commits and tracked changes, adding untracked files. Classify each file into exactly one category. Tests include their fixtures and helpers; generated includes lockfiles and vendored code. Omit empty rows and note binary files.

| | Lines |
|---|---:|
| Code | +a / -b |
| Tests | +a / -b |
| Generated | +a / -b |
| Docs and config | +a / -b |

## Style

Use short sentences, one point each, and few identifiers. Prefer plain words; cut filler, stacked hedges and sales tone. Attach screenshots or recordings when they prove a claim.

Finish when the reader can tell what is now true, where it stops, what could break, how strong the evidence is and what they need to do, and every claim matches the final state.
