---
name: feature-grounding
description: Ground a feature request, reported limitation or proposed change in the repository's purpose and contracts when deciding what belongs here.
---

# Feature grounding

Assess whether and how a request fits what this project is willing to implement and maintain.

Assess the supplied request against this repository. Treat attached code as a candidate solution. Return a read-only recommendation in the conversation; leave execution to the surrounding task.

## Establish the need

Separate the desired outcome and essential constraints from the proposed solution. Check reported limitations against relevant code or a focused reproduction.

State the need independently of implementation, preserving material requirements and identifying decision-changing assumptions or gaps.

## Ground it in the repository

Establish the project's purpose, supported uses and relevant contracts from guidance, interfaces, implementation and tests. Consult history where intent is unclear. Distinguish documented direction from inference and current behaviour.

Check whether existing capabilities meet the need. Consult external examples where they help decide whether and how the capability fits the project.

Identify the gap, or explain how existing capabilities meet the need, with supporting repository evidence.

## Decide what to support

Decide which capabilities and guarantees the project should provide for its users. Assess their value, effects on other supported uses, defaults, failure behaviour and ongoing maintenance cost.

Recommend accepting, reframing or rejecting the request based on that fit. Acceptance is not assumed. When a change is justified, recommend the smallest coherent capability that meets the need. Justify broader capability through demonstrated needs or established contracts; one real use case can be sufficient.

Account for each material requirement: supported today, proposed here, addressed separately, outside scope or unresolved. Explain consequential departures from the supplied proposal.

## Check the outcome and recommend

For a supported direction, show how it enables the original outcome and identify remaining work or choices. Use a brief example where helpful; distinguish feasible use from verified results. For rejection, explain why meeting the need would exceed or conflict with the project's remit.

Return the need, repository fit and evidence, recommendation, maintenance commitments and material trade-offs. Finish when every material requirement is accounted for and the path to the outcome, reason for rejection or evidence needed to decide is clear.
