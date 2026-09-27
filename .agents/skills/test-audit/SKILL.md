---
name: test-audit
description: Audit test value and coverage, identify redundant or implementation-coupled tests, and assess whether proposed tests add meaningful regression confidence.
---

# Test audit

Optimise for confidence per maintained line. Apply to the requested scope; an audit is read-only unless changes are requested.

## Value gate

For each new test or audit candidate, establish:

- The observable behaviour, invariant or independently specified contract it protects.
- A credible regression that would make it fail for the intended reason.
- What it catches that existing coverage does not. Prefer one primary test at the boundary responsible for the behaviour; another layer needs a distinct risk.
- Whether it demands an export, flag, wrapper or injection hook used only by tests. Prefer exercising the real boundary.

Extend existing cases where appropriate. For bug fixes, demonstrate that the regression test fails before the fix and passes afterwards; disclose when that proof cannot be run.

## Low-value patterns

- Assertions that compare a value with itself, copy implementation logic, or derive expectations from the code under test.
- Mocks or fixtures that supply the very behaviour being asserted; assertions that only verify mock setup or a store the real path never writes.
- Copied constants, inventories, flags, exports or source text without an independent contract.
- Private helper, call-shape or ordering assertions that fail under behaviour-preserving refactoring.
- Repeated coverage of the same failure across layers or consumers of a shared helper.
- Assertion-free execution without a meaningful failure signal.
- Negative cases that pass because of an unrelated guard, unreachable path or incorrectly configured mock.
- Test names that claim more than the inputs and assertions exercise.
- Tests preserving otherwise unused production code or test-only interfaces.

These are investigation signals. Retain independently meaningful API, protocol, storage, migration, security, platform, packaging and architecture contracts. Ordering and exact bytes can be observable behaviour; source inspection can be the cheapest independent guard. Slowness or resemblance to implementation alone does not justify deletion.

## Audit and repair

Read the complete test, production owner, relevant callers, overlapping coverage and history before judging it. Check dependency source or types when the claimed behaviour depends on them, and verify which tests CI actually runs.

For each proposed deletion, identify the test and location, the failure it can detect, stronger remaining coverage (or why none is needed), why it exists, non-test users of any affected code, and the validation needed. Missing evidence means retain it pending investigation.

When changes are requested, work in coherent batches: consolidate duplicate coverage, move useful regressions to the responsible boundary, and remove demonstrably unused test support and production seams. Investigate retained tests that fail on the baseline as possible product bugs.

Run focused tests for affected behaviour and adjacent consumers, plus repository-required checks. For removed static assertions, exercise the actual contract where practical. Finish with concrete findings, retained coverage, validation results and limitations, and separate production and test/support line deltas. Treat line counts as evidence, never deletion targets.
