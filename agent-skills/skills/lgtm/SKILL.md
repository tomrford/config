---
name: lgtm
description: Take an agreed candidate from a pushed branch or draft PR through fresh independent scrutiny and review-bot feedback, if present, to merge. Use when the user hands off an accepted change with LGTM; an explicit ready-to-merge request stops before merging.
---

# LGTM

The user has seen the high-level result or agreed the intended change. Finish the review and verification loop, then merge when all criteria pass. Invoking this workflow authorises opening or updating the candidate's PR, requesting review, addressing findings and merging. An explicit instruction such as "`lgtm`, take it to ready to merge" stops at readiness.

## Establish the candidate

Read the agreed scope, repository instructions, current diff and existing verification evidence. Identify the PR's head and base, required checks and relevant project verification recipes. Open a PR from the pushed branch if needed and mark it ready for review. Write its title and body with the `pr-authoring` skill, and keep them current as the candidate changes.

Use prior testing and verification where it still describes the candidate's contents and environment. This is the final confidence pass on an understood change; choose further scrutiny around its remaining risks.

## Review and iterate

Require a fresh-context independent subagent pass and, if a review bot is present, a completed, clean bot pass against the current HEAD. Give the subagent the agreed intent and candidate, leaving it to reach its own conclusions:

- For a small diff, ask it to read the diff and check correctness and fit with the agreed intent.
- For larger work, ask for a high-level pass through the change and existing evidence, focusing on assumptions and consequential paths.
- Where meaningful project verification exists, ask it to exercise the relevant behaviour. Delegating a routine test command alone does not provide independent scrutiny.

Triage findings against the code and intended behaviour. Correct issues within the agreed shape, push, and repeat affected review and verification. Explain disproven findings on their review threads and resolve addressed threads. A running review or absence of comments is not a clean pass.

**If a finding requires changing the agreed design, approach, scope or expected behaviour, stop this workflow and return for reassessment.** Explain the finding, its implications and the proposed decision. Resume only after the user agrees the revised candidate.

After a push, rebase or base change, reassess which evidence remains valid. If a review bot is present, obtain a clean pass on the new HEAD. Refresh independent scrutiny and verification where their assumptions or tested contents changed. Report unmet gates precisely; leave the candidate unmerged while they remain unmet.

## Finish

Immediately before merging, confirm the head and base still match the assessed candidate, required checks pass, review feedback is handled, relevant verification passes and the repository permits merging.

Post one short PR comment identifying HEAD and the completed independent, verification and repository checks, including the bot result if present. Edit that comment if the candidate changes.

In ready-only mode, post the comment and report readiness, leaving the PR open. Otherwise merge using repository preferences, confirm the merged state and relevant post-merge checks, and report the PR, merged revision and any remaining failure. Branch and worktree cleanup are outside this workflow.
