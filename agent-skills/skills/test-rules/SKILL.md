---
name: test-rules
description: Apply when deciding whether to add, change, remove or review automated tests or other committed checks, including runtime, integration, type-level and compile-time tests.
---

# Test rules

Tests protect agreed behaviour while leaving implementation choices replaceable. Optimise for confidence per maintained line. Apply these rules when choosing, writing and reviewing tests; they do not prescribe whether tests or code come first.

## A test must add knowledge the code does not hold

- A test earns its place by protecting an agreed requirement, spec, edge-case outcome, failure behaviour or regression. It should show what consumers must be able to rely on and why.
- How existing callers happen to use a function is not a contract. Test what was agreed, not what the code currently does.
- The implementation is evidence of how something works, not authority for how it should work. Derive consequences of the agreed contract; do not invent new guarantees. Raise material ambiguity instead of pinning a guess in a test.
- Decide the expected result from an independent source before running the code: a requirement, spec, worked example, real captured input or reference result.

## Select coverage worth maintaining

- Before adding coverage, identify the agreed behaviour, a plausible consumer-visible failure, the assertion that catches it, and what existing tests would miss. Keep the smallest useful scenario.
- Additional scenarios must protect against distinct plausible failures or independently required compatibility behaviour. Different symptoms or inputs alone do not earn separate tests.
- Validate reported effects as needed. Temporary executable reproductions can establish evidence without becoming permanent tests. A list of reported symptoms is not a required list of committed scenarios.
- Prefer coherent lifecycle scenarios over many single-operation tests. Include promised failure, cancellation and recovery; assert effects throughout. Keep failures diagnosable and variants on independent state.
- Use distinguishable inputs that expose a mix-up. Exact bytes, ordering and counts are valid expectations when consumers can observe and rely on them.
- Weigh test code, fixtures and helpers against the protection they add; trim duplication and unneeded setup. For a large input matrix, consider one property test of an independently justified invariant.
- Coverage percentages and test counts are diagnostics, not targets.

## Never write these

- Tests of the language, type system, compiler, runtime, standard library or a dependency. This includes types or values asserted to match the declaration they were derived from.
- Tests that restate source: constants, enums, defaults, literals, mappings, registries, export or file existence, declaration compilation. Arithmetic on a constant is still a restatement: `5 * MINUTES_TO_SECONDS == 300` adds nothing.
- Tests whose expected value comes from the code under test: comparing a result with itself or with the same logic, pasting the code's output into the assertion, accepting an unchecked snapshot.
- Tests that check no behaviour: no meaningful assertion, only fixtures or mocks, only that internal calls happened, never reaching the path they claim.

Low cost, documentation, API compatibility, coverage gains and protection against accidental edits do not justify these tests. Do not add or imitate them; flag existing ones for removal.

## Prove each test detects a real failure

After selecting the coverage worth maintaining, prove sensitivity for each new or materially changed scenario. Failure against the defect establishes sensitivity, not independent value.

- Break production behaviour in a way a consumer would notice, run the test, confirm it fails for that reason, then restore and confirm it passes. For a bug fix, run against the defect and the fix.
- Changing a restated value or declaration, or failing on missing symbols, fixtures or implementation, proves no behavioural sensitivity.
- Keep a test only if it detects a plausible production failure and adds independent protection under the selection rules above.
- If you could not run the check, say so in the handoff; do not claim it.

## Test through the consumer's boundary

- Call the interfaces consumers use, as they would, with real internal components working together. Prefer end-to-end and integration tests.
- A boundary is a capability and its consumers, not a file, class or export. Exporting a helper does not make it worth its own tests.
- Test a smaller component on its own only when the user specified its behaviour, or its failures cannot be reached or diagnosed through the boundary. Then list how it can fail first, and test those failures.
- Cover guarantees at their owning layer; additional layers must earn their place under the same selection rules.
- A test that breaks under a behaviour-preserving refactor asserts implementation. Do not add it.
- Round trips and agreement between implementations prove only that relationship, not correctness.
- If awkward combinations reveal an over-permissive interface, fix the interface instead of testing behaviour nobody needs.

## Use real collaborators

- Use real project-owned code; contain effects with isolated files, stores and transports.
- Setup may establish prerequisites, but must not perform the production decision being verified. Exercise that decision through its owning interface: supplying separate directories tests downstream isolation, not production directory selection.
- Substitute external dependencies only for isolation, determinism or cost, and never let the substitute supply the behaviour under test.
- Do not add production exports, flags, wrappers or injection hooks just to reach internals.
- Heavy mocking, complex setup and repeated exceptions are signs the boundary or design is wrong. Rethink it before adding more test machinery.

## Evolve coverage with the code

- New behaviour: extend the owning scenario if it is the same coherent use; otherwise add an independent one.
- Bug fix: the smallest test change that distinguishes the defect from the fix.
- Refactor: setup may change; assertions and expected results may not.
- Intentional behaviour change: update the expectations. Removed behaviour: remove its tests and test-only support.
- Review additions for redundant scenarios, fixtures, helpers and harnesses as well as coverage gaps. Recommend removal where existing coverage provides the same protection.
- Before deleting redundant coverage, confirm the remaining tests protect the same behaviour.
- Never delete, skip or weaken a failing test to make the suite pass. Find out whether it exposes a bug, a wrong expectation or a contract change. Fix the code, or ask.
