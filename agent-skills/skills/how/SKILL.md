---
name: how
description: 'Use for "how does X work", code walkthroughs before changing something, and placement / ownership / layering questions ("where should this live", "which package owns this", "is this the right layer"). Explains subsystem architecture, runtime flow, onboarding mental models. Use `why` for motivation.'
---

# How

Build an accurate mental model that lets a senior engineer new to the area reason about the system and work in it confidently.

If the scope is ambiguous, state your interpretation and proceed.

## Trace the real implementation

Start with the capability and its consumers. Find the entry point: what triggers it, whether a user action, API call, job or event. Follow the call chain through the code: how data and control move and transform, the decision points, who owns state and resources, and what the caller observes. Map the central types and abstractions and the boundaries where the subsystem meets others. Follow consequential failure and lifecycle paths as well as normal operation.

Read the implementation; don't infer behaviour from names. Public interfaces, internal structure, tests and runtime behaviour may tell different parts of the story. Resolve contradictions by checking the code rather than repeating the most convenient account. Use a focused experiment when static inspection leaves an important behaviour uncertain.

Keep going until you can describe the important paths without guessed transitions, with evidence for ownership, transformations and consequential lifecycle behaviour. A gap that accessible code or a focused experiment could resolve calls for more investigation. Where a link remains blocked, identify it and what prevents tracing it; don't substitute a plausible guess.

## Explain the constraints

Explain the underlying constraints and invariants. Distinguish what the problem requires from how the current implementation happens to solve it. For placement or design questions, reason from those requirements before accepting existing boundaries.

## Choose the investigation strategy

Choose how to cover the subsystem. When it spans several packages or services, or a feature cuts across layers, parallel explorers on distinct slices (entry points, core flow, persistence, integrations) usually pay off; have each report facts with `file:line`, the flow step by step, and what it couldn't trace. Delegation doesn't replace coverage of the important paths. Reconcile overlaps and contradictions against the code yourself, and support the resulting explanation with `file:line` evidence.

## Explain

Lead with the mental model: what it is, what it does and why it exists. Introduce the few concepts needed to follow the rest, then walk the important flow and decisions. That walk is the core of the answer. Point to the files a maintainer should start in, and surface gotchas, surprising behaviour and open gaps. Use a diagram when components interact or data moves through stages, not as decoration.

Use concrete names: "`UserService` calls `AuthClient.refresh()`", not "the service delegates to the client". Use prose rather than pseudocode, and quote code only when a snippet is essential. When something is complex, explain why; when it is simple, don't pad it.

Keep detail proportional to the question. Explain the system rather than narrating the investigation or paraphrasing every file. Investigation does not itself authorise implementation changes.
