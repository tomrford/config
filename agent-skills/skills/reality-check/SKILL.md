---
name: reality-check
description: Assess whether a reported issue or proposed change matters in practice and whether the proposed response is proportional to its risk and maintenance cost.
---

# Reality check

Evaluate the practical significance of an issue before recommending or implementing a fix. A possible failure is not, by itself, evidence that a change is worthwhile.

Establish:

- **Likelihood:** How can this occur in real usage? Consider actual traffic, concurrency, deployment conditions and prerequisites. Distinguish a plausible scenario from a contrived one.
- **Impact:** What would users, operators or downstream systems experience? Explain how that differs from the expected behavior and why the difference matters.
- **Cost:** What complexity, maintenance, testing and operational burden would the proposed change introduce? Consider simpler alternatives, including accepting the issue.

Use likelihood and impact together to judge the risk, then weigh it against the cost of the response. Rare but severe outcomes may still warrant action; minor outcomes do not automatically justify elaborate fixes.

Ground the assessment in available evidence. Do not invent probabilities, usage patterns or consequences. State material unknowns and how they could change the judgment.

Give a clear recommendation: fix it, use a simpler mitigation, accept it, or gather specific missing evidence. Explain why the response is proportional to the risk.
