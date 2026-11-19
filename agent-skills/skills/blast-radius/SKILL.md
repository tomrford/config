---
name: blast-radius
description: "Find what a change could break somewhere else before it ships, beyond the diff, and prove the facts its safety depends on by running real code rather than writing it up. Use for 'blast radius of X', 'what could this break', or reviewing a small diff you don't trust."
---

# Blast radius

Find the consequences a local reading of the diff would miss, and prove the facts that make the change safe.

Listing direct callers is the easy part. The job is the breakage a symbol search won't show. A writeup that sounds right is worth nothing on its own: it reads as convincing whether or not it is true.

## Understand the change

Establish the intended outcome and what actually changes: symbols added, changed and removed, removed behaviour, and implicit guarantees the diff doesn't spell out. Read the PR and commits where they exist.

## Find the load-bearing facts

Most changes that look risky are safe because of one or two facts, such as "this call only evicts entries that are already dead". Find them. If they hold, most risky cases clear at once. Spend effort here rather than on a long list of maybes.

## Look where grep stops

Read the source of dependencies the change relies on, at the pinned version and with any local patch. Work out when things run: async ordering, lifecycle and teardown, retries, concurrent callers. Follow what a symbol search misses: API payloads, database columns and persisted data, wire formats, other languages or services reading the same bytes, configuration and feature flags, and code several hops downstream.

## Prove it

For each load-bearing fact, take it as far down this ladder as you reasonably can and report where it stopped:

1. Asserted. Worth nothing on its own.
2. Cited. A real `file:line`, or the dependency's own source.
3. Reasoned. The failure path walked step by step and shown not to reach.
4. Exercised. A script or test calling the real code that fails loudly if the fact is wrong.
5. Reproduced in the running application.

Static reasoning can prove structural guarantees when it establishes why the failure path cannot occur. Consequential runtime claims require execution evidence at step 4 or 5. Choose the proof method: an existing behavioural test, a focused script using what the app ships, or a reproduction in the application. Passing checks support only the cases and conditions they cover. If execution is blocked, identify the blocker and leave the runtime claim unproven.

## Widen the search when it pays

Choose how to investigate the affected surfaces and challenge the safety facts. When a change reaches several consumer surfaces, tracing them in parallel is usually worth it. For a consequential change, hand a fresh agent the diff and the claimed safety facts and ask it to break them. Reconcile the evidence yourself.

## Report

Finish when consequential safety claims have supporting proof or specific blockers are reported. An unresolved claim remains a risk; a persuasive explanation or an absence of findings does not clear it.

- **What changes**, including the non-obvious effects on consumers.
- **Load-bearing facts**, each with its ladder step and proof: the structural argument and code evidence, or the test or reproduction and its output. Distinguish proven structurally, exercised, and unproven. For unproven facts, say what would settle them.
- **Risks**, each with how it breaks, where (`file:line`), its trigger conditions and consequences, and how to check it.
- **Cleared**, what was investigated and why it is fine.
- **Before shipping**, the cheapest test or reproduction that would catch the real failure.

Cite real code. A search that finds nothing is a result; never invent a caller or an API. Don't invent likelihood estimates or declare safety from an absence of findings. Keep experiments isolated and leave product changes to the surrounding task.
