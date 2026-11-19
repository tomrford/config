---
name: why
description: 'Use for "why does X work this way", "why we picked Y", design rationale, regressions, postmortems, or data-backed thresholds. Investigates history and relevant connected evidence sources, then returns a cited read on decisions and tradeoffs. Use `how` for runtime behavior.'
---

# Why

Establish what led to the current design without inventing a tidy rationale for it.

Code shows what it does, not why it exists. The reason lives in commits, PRs, issues, documents and conversations, all of them incomplete. A confident guess presented as history misleads the reader, who will act on it.

## Anchor the target

Pin down the files, line ranges, symbols and constants in question. If the target is vague, state your interpretation and proceed.

## Search the history

Establish where the decision originated and how it changed. Choose the tools and search order, but cover:

- The history of the target through renames and moves.
- The introduction of key strings, constants or patterns, not just their last edit. Blame and `git log -S` / `-G` can help locate these.
- Read the PR, review discussion and linked issues for each substantive commit. Read them in full; the reason is often in a comment or a follow-up.
- Check in-repo records: comments, ADRs, changelogs, and tests whose cases reveal the motivating edge case.

Trace back past the most recent edit; the current shape is often an accretion of earlier decisions. Squash merges hide branch history, so lean on the PR body. A copied pattern needs tracing to where it first appeared. Bot commits carry no intent. A misleading commit message needs checking against the diff.

## Search the other sources

Investigate connected sources that could materially establish or challenge the explanation: issue trackers for the product or business driver, documents for designs and rejected alternatives, chat for decisions that never reached a document, and error or operational tools for the incidents behind defensive code, retries and thresholds. Account for relevant sources left unsearched; finding a plausible answer elsewhere is not sufficient reason to skip contrary evidence. An empty search is a finding. A source you could not access is a gap, not a null. A metric or event existing shows someone cared about it, not that it caused the code.

Choose the search order, grouping of sources and use of delegation. When several sources are connected, a subagent per source with the code anchor and question is usually worthwhile; have each quote verbatim with exact locations and record what it searched rather than draw conclusions. For a consequential or contested interpretation, have a fresh agent argue the strongest alternative. Preserve exact source locations and search coverage whichever method you use, and weigh the evidence yourself.

## Weigh the evidence

Treat any explanation embedded in the question as one hypothesis among others, and look for evidence that would disprove the leading account. Label each claim:

- **Documented**: someone wrote the reason. Quote and cite it.
- **Supported**: several indirect pieces converge. Cite each.
- **Inferred**: your reading of the context. Show the chain and hedge the wording.
- **Unknown**: you looked and found nothing. Say what you searched and with which queries.

Use "because", "was designed to" or "the team decided" only next to a citation. Code is not evidence of its own intent, and a plausible benefit today is not evidence that it motivated the decision. When sources conflict, show both rather than picking the tidier story. Absence of evidence is not evidence of absence.

## Report

Finish when the explanation is supported and credible alternatives have been investigated, or when relevant accessible evidence has been exhausted. One plausible account is insufficient. If access or another concrete blocker prevents completing the investigation, report the unresolved question and the blocker rather than treating the explanation as established.

Lead with the best-supported explanation and its evidence, using the labels above. Include competing hypotheses where the record supports more than one, and specific gaps: what was searched, how, and what came back. List each source consulted, including the empty and unavailable ones, so the reader can judge coverage. Say who would likely know when the record runs out.

When the question precedes a change, separate historical reasons from present requirements and turn the findings into what to preserve, what can change, what to avoid and the remaining risks. Keep recommendations distinct from historical findings, and leave implementation to the surrounding task.
