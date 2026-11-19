---
name: heartbeat-scratchpad-loop
description: Build or run a long-lived task as a self-modifying heartbeat where the automation prompt acts as compact working memory. Use when the user wants an automation, monitor, recurring check-in, polling loop, watch task, or long-running search/research/process that should wake up over time, do one focused step, rewrite its own state, and continue later.
---

# Heartbeat Scratchpad Loop

Use this skill when the user wants a lightweight long-running task that persists through recurring heartbeats and updates itself over time.

The core pattern is:

- the recurring context is the execution surface
- the available tools are the action surface
- the automation prompt is the scratchpad

Prefer this over a static reminder when the task needs memory, iteration, ranking, reprioritization, or recurring validation.

## When To Use

Use this skill for requests like:

- "set up a loop to keep checking this"
- "poll yourself every few minutes and keep going"
- "monitor this topic/contact/project over time"
- "create a long-running search task"
- "use automations as a scratchpad"
- "wake this context later and continue"

Do not use this pattern for:

- one-shot reminders with no state
- tasks that should obviously be a detached scheduled task against a workspace instead of the current context
- tasks with no clear objective or no meaningful action surface

## Workflow

1. Decide the execution shape.

- Prefer a heartbeat automation when the task should continue in the current context.
- Prefer detached scheduling only when the work should run detached against a workspace.
- If an existing automation already owns the task, update it instead of creating a duplicate.

2. Reduce the task to objective `X` plus tool/data surface `Y`.

Take the objective, starting context, and work location from the user. Setup choices, including the items below, must come from the user or be clearly inferable from the supplied location/context and its established instructions and conventions. Ask the user when necessary information or any other material choice cannot be clearly inferred; do not invent defaults.

Define, in plain terms:

- objective
- data sources and tools
- ranking criteria
- what counts as progress
- notification threshold
- stop condition
- cadence

3. Seed the first prompt compactly.

The first prompt should contain:

- `Current objective`
- `Sources to use`
- `Current state`
- `Ranked candidates / hypotheses / tasks`
- `Deprioritized items`
- `Next actions`
- `Guardrails`
- `Stop condition`

4. Run the control loop on each wakeup.

Each heartbeat should do one focused unit of work:

- inspect the current automation state
- inspect the external sources
- validate or rank 1-3 concrete items
- save durable work to the supplied work location and checkpoint meaningful progress according to its established instructions and conventions
- rewrite the automation prompt with fresher compact state
- notify the user only if something crosses the notification threshold

Do not let the loop sprawl. Small focused steps beat broad rescans.

5. Keep the scratchpad compact.

- Overwrite stale sections instead of appending endlessly.
- Promote only the highest-signal facts into the prompt.
- Keep lists ranked.
- Use absolute dates.
- Remove obsolete branches.

6. Close the loop when done.

- Delete the automation when the objective is complete, stale, or no longer worth polling.
- If the task survives but the shape has changed, update the automation instead of letting stale instructions linger.

## Persistence

When bootstrapping the control loop in the location supplied by the user:

- infer persistence and checkpointing behavior from that location's established instructions and conventions
- save durable work there as meaningful units of work land
- mention the work location and inferred persistence and checkpointing behavior when seeding or updating the loop prompt so the automation keeps treating persistence as part of progress

## Scratchpad Rules

- The prompt is short-term memory, not a transcript.
- Prefer ranked bullets over narrative paragraphs.
- Store conclusions, not raw dumps.
- Track only the next few actions, not every possible branch.
- Keep one automation as the canonical owner for one subproblem.

Good scratchpad sections:

- `Current objective`
- `Signals / evidence`
- `Ranked leads`
- `Open questions`
- `Next actions`
- `Guardrails`

## Multi-Automation Pattern

For bigger tasks, split by role:

- `scout`: finds new candidates
- `validator`: checks whether candidates are real/relevant
- `monitor`: watches inbox/calendar/messages/news/source changes
- `coordinator`: maintains the merged shortlist and user-facing updates

Only split when the loops are genuinely separable. If not, keep one automation.

## Tooling

Use the capabilities actually available in the environment to create, update, view, or delete the automation and read and write the supplied work location. This skill does not provide scheduling. If recurring execution, self-editing of the recurring prompt, or access to the required sources or work location is unavailable, stop and explain what is missing; do not invent a replacement.


## Response Style

When building one of these loops:

- say what the loop is for
- say what tool/data surfaces it will use
- make the automation prompt the scratchpad
- keep cadence and stop conditions explicit
- prefer concrete ranked state over vague ambitions
