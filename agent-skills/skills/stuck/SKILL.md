---
name: stuck
description: Use when the behavior is agreed but you're unsure how to implement it.
---

- Does a library or framework already in use cover this? Follow its docs and examples for the version in use. Prefer the built-in feature when it leaves less code to maintain, even if it can do more than requested.
- Is a business rule still uncertain? Try the smallest change that meets the stated requirements. Treat the inferred rule as provisional. Write tests only for behavior the user explicitly specified.
- Review each added line. Would you expect to find it in an exemplary project using this stack? Simplify or remove any line that fails that check.
