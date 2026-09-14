---
name: review-and-simplify
description: Review a specified branch, PR, diff or other target for lean code, simplicity, correctness and minimalism, including code and test line-count sanity checks.
---

- Review the supplied target for lean code, simplicity, correctness and minimalism: every line should earn its place.
- Look for bugs, unnecessary abstractions, duplication, dead code and opportunities to consolidate or delete.
- Compare added, removed and net lines separately for production code and tests against the appropriate base.
- Be critical of disproportionate test growth, especially in refactors.
- Tautological tests should be considered harmful.
- Report concrete findings and simplification opportunities with file references, prioritised by impact.
